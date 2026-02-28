# Add Naveen's defaults to the XDG config path
if [[ -z "$XDG_CONFIG_DIRS" ]]; then
    export XDG_CONFIG_DIRS="/etc/xdg-naveen:/etc/xdg"
else
    export XDG_CONFIG_DIRS="/etc/xdg-naveen:$XDG_CONFIG_DIRS"
fi
