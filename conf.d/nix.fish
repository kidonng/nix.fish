set -l profile ~/.nix-profile

set -l channels ~/.nix-defexpr/channels
contains $channels $NIX_PATH || set -agx NIX_PATH $channels

function _nix_install -e nix_install -V profile
    set -Ux NIX_PROFILES /nix/var/nix/profiles/default $profile

    for file in /etc/{ssl/{certs/ca-certificates.crt,ca-bundle.pem,certs/ca-bundle.crt},pki/tls/certs/ca-bundle.crt} $profile/etc/{ssl/certs/,}ca-bundle.crt
        if test -e $file
            set -Ux NIX_SSL_CERT_FILE $file
            break
        end
    end
end

function _nix_uninstall -e nix_uninstall
    set -e NIX_{PATH,PROFILES,SSL_CERT_FILE}
    functions -e _nix_{,un}install
end

test -n "$MANPATH" && set -p MANPATH $profile/share/man

set -l bin $profile/bin
contains $bin $PATH || set -p PATH $bin

set -l store (string replace -rf '/bin$' "" (string match "/nix/store/*" $PATH))
if test (count $store) != 0
    set fish_complete_path $fish_complete_path[1] \
        $store/share/fish/vendor_completions.d \
        $fish_complete_path[2..]
    set fish_function_path $fish_function_path[1] \
        $store/share/fish/vendor_functions.d \
        $fish_function_path[2..]
end
