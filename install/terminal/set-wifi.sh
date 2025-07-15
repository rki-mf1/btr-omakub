# Disable wifi when wired networking is connected and vice versa. Avoids
# annoying wifi-related messages when connected to the wired network in an
# area with a weak wifi signal.
# https://superuser.com/a/367472

sudo tee /etc/NetworkManager/dispatcher.d/99-wlan >/dev/null <<'EOF'
#!/bin/bash
wired_interfaces="en.*|eth.*"
if [[ "$1" =~ $wired_interfaces ]]; then
    case "$2" in
        up)
            nmcli radio wifi off
            ;;
        down)
            nmcli radio wifi on
            ;;
    esac
fi
EOF

sudo chmod +x /etc/NetworkManager/dispatcher.d/99-wlan
