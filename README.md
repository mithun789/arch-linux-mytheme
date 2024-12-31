# 🎨 KDE Plasma Theme Backup & Restore Tool

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![KDE Plasma](https://img.shields.io/badge/KDE_Plasma-6-blue)](https://kde.org/plasma-desktop/)
[![Arch Linux](https://img.shields.io/badge/Arch_Linux-supported-success)](https://archlinux.org/)

> A powerful bash script to backup and restore your complete KDE Plasma 6 theme configuration, making your desktop setup portable and shareable! 🚀

![KDE Plasma Banner](https://raw.githubusercontent.com/KDE/plasma-workspace/master/wallpapers/Next/contents/images/5120x2880.png)

## ✨ Features

- 📦 Complete theme backup including:
  - Panel configurations
  - Plasma desktop settings
  - Color schemes
  - Icon themes
  - Wallpapers
  - Desktop themes
  - Look and feel packages
  - Custom widgets/plasmoids

- 🛡️ **Safety Features**:
  - Timestamped backups
  - Directory structure preservation
  - Graceful handling of missing files
  - Detailed progress feedback
  - Built-in error checking
  - Permission preservation

## 🚀 Installation

1. **Clone the repository**:
```bash
git clone https://github.com/mithun789/arch-linux-mytheme.git
cd arch-linux-mytheme
```

2. **Make the script executable**:
```bash
chmod +x kde-theme-backup.sh
```

## 💻 Usage

### Creating a Backup

```bash
./kde-theme-backup.sh backup
```
This will create a timestamped `.tar.gz` file containing all your theme-related files.

### Restoring from Backup

```bash
./kde-theme-backup.sh restore kde-theme-backup_20240331_123456.tar.gz
```

### Getting Help

```bash
./kde-theme-backup.sh help
```

## 📁 What Gets Backed Up?

The script backs up the following directories and files:

### 🔧 Configuration Files
```
~/.config/
├── plasma-org.kde.plasma.desktop-appletsrc
├── plasmarc
├── plasmashellrc
├── kdeglobals
├── kwinrc
├── kscreenlockerrc
├── kcmfonts
└── kcminputrc
```

### 🎨 Theme-related Directories
```
~/.local/share/
├── plasma/
├── color-schemes/
├── aurorae/
├── icons/
├── wallpapers/
├── plasma/desktoptheme/
├── plasma/look-and-feel/
└── plasma/plasmoids/
```

## 🤝 Contributing

Contributions are always welcome! Here's how you can help:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## ⚠️ Requirements

- Arch Linux
- KDE Plasma 6
- Basic bash utilities (`tar`, `cp`, `mkdir`, etc.)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Mithun Kumar**
- GitHub: [@mithun789](https://github.com/mithun789)

## 🌟 Support

If you found this project helpful, please consider giving it a star on GitHub! ⭐️

## 📣 Acknowledgments

- KDE Community for the amazing Plasma desktop environment
- Arch Linux community for their excellent documentation
- All contributors who help improve this tool

---

<p align="center">Made with ❤️ for the KDE Plasma community</p>
