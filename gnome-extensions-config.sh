#!/bin/bash

CONFIG_FILE="extensions.conf"
DCONF_PATH="/org/gnome/shell/extensions/"

function export_extensions() {
    echo "Exporting..."
    dconf dump $DCONF_PATH > $CONFIG_FILE
    echo "Exported $CONFIG_FILE"
}

function import_extensions() {
    if [[ -f "$CONFIG_FILE" ]]; then
        echo "Importing $CONFIG_FILE..."
        dconf load $DCONF_PATH < $CONFIG_FILE
        echo "Imported."
    else
        echo "File $CONFIG_FILE not found. 404 :("
    fi
}

case "$1" in
    export)
        export_extensions
        ;;
    import)
        import_extensions
        ;;
    *)
        echo "Uso: $0 {export|import}"
        ;;
esac
