#!/bin/bash

# KDE Plasma 6 Theme Backup and Restore Script
# This script creates/restores backups of KDE Plasma theme-related files
# Compatible with Arch Linux and KDE Plasma 6

# Set backup filename
BACKUP_NAME="kde-theme-backup.tar.gz"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Define paths to backup
PATHS=(
    # KDE config files
    "$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"
    "$HOME/.config/plasmarc"
    "$HOME/.config/plasmashellrc"
    "$HOME/.config/kdeglobals"
    "$HOME/.config/kwinrc"
    "$HOME/.config/kscreenlockerrc"
    "$HOME/.config/kcmfonts"
    "$HOME/.config/kcminputrc"
    
    # Theme-related directories
    "$HOME/.local/share/plasma"
    "$HOME/.local/share/color-schemes"
    "$HOME/.local/share/aurorae"
    "$HOME/.local/share/icons"
    "$HOME/.local/share/wallpapers"
    "$HOME/.local/share/plasma/desktoptheme"
    "$HOME/.local/share/plasma/look-and-feel"
    "$HOME/.local/share/plasma/plasmoids"
)

# Function to backup theme files
backup_theme() {
    echo "Starting KDE Plasma theme backup..."
    
    # Create temporary directory for config files
    TEMP_DIR=$(mktemp -d)
    
    # Check if paths exist and copy them
    for path in "${PATHS[@]}"; do
        if [ -e "$path" ]; then
            # Preserve directory structure
            RELATIVE_PATH=${path#$HOME/}
            TARGET_PATH="$TEMP_DIR/$RELATIVE_PATH"
            
            # Create directory structure
            mkdir -p "$(dirname "$TARGET_PATH")"
            
            # Copy files/directories
            if [ -d "$path" ]; then
                cp -r "$path" "$(dirname "$TARGET_PATH")"
            else
                cp "$path" "$TARGET_PATH"
            fi
            echo "Backed up: $path"
        else
            echo "Warning: $path not found, skipping..."
        fi
    done
    
    # Create tar archive
    BACKUP_FILE="kde-theme-backup_$TIMESTAMP.tar.gz"
    tar czf "$BACKUP_FILE" -C "$TEMP_DIR" .
    
    # Cleanup
    rm -rf "$TEMP_DIR"
    
    echo "Backup completed! Archive created: $BACKUP_FILE"
    echo "Size: $(du -h "$BACKUP_FILE" | cut -f1)"
}

# Function to restore theme files
restore_theme() {
    if [ ! -f "$1" ]; then
        echo "Error: Backup file not found!"
        exit 1
    fi
    
    echo "Starting KDE Plasma theme restoration..."
    
    # Create temporary directory for extraction
    TEMP_DIR=$(mktemp -d)
    
    # Extract archive
    tar xzf "$1" -C "$TEMP_DIR"
    
    # Restore files to their locations
    cd "$TEMP_DIR" || exit 1
    
    # Restore each path
    find . -type f | while read -r file; do
        # Remove leading ./
        RELATIVE_PATH=${file#./}
        TARGET_PATH="$HOME/$RELATIVE_PATH"
        
        # Create directory structure
        mkdir -p "$(dirname "$TARGET_PATH")"
        
        # Copy file
        cp -f "$file" "$TARGET_PATH"
        echo "Restored: $TARGET_PATH"
    done
    
    # Cleanup
    cd - || exit 1
    rm -rf "$TEMP_DIR"
    
    echo "Restoration completed!"
    echo "Please log out and log back in for changes to take effect."
}

# Function to display help
show_help() {
    echo "KDE Plasma Theme Backup/Restore Script"
    echo "Usage:"
    echo "  $0 backup                   - Create a new theme backup"
    echo "  $0 restore <backup_file>    - Restore theme from backup"
    echo "  $0 help                     - Show this help message"
}

# Main script logic
case "$1" in
    "backup")
        backup_theme
        ;;
    "restore")
        if [ -z "$2" ]; then
            echo "Error: Please specify the backup file to restore from!"
            echo "Usage: $0 restore <backup_file>"
            exit 1
        fi
        restore_theme "$2"
        ;;
    "help"|"--help"|"-h"|"")
        show_help
        ;;
    *)
        echo "Invalid option: $1"
        show_help
        exit 1
        ;;
esac
