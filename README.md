# OLSApp – Free PHP Script Installer & WordPress Manager (Softaculous Alternative)

**OLSApp** is a free and lightweight PHP-based app installer and WordPress management tool. It works on **any PHP hosting server** and supports one-click installation of apps like WordPress, Joomla, Laravel, and more.  
It also includes advanced tools for **WordPress plugin, theme, and user management**, along with **cloning**, **backup**, and **restore** functionality.

## 🚀 Easy Installation on cPanel
Install OLSApp directly via terminal with a single command:

```bash
curl -sSL https://olspanel.com/olsapp/cpanel.sh | sed 's/\r$//' | bash



You can install **OLSApp** on cPanel in just a few simple steps:

1. **Download the installer**  
   👉 [Download install.php](https://github.com/osmanfc/olsapp/releases/download/install/install.php)

2. **Upload** the `install.php` file to your cPanel **File Manager** (inside `public_html` or your desired directory).

3. **Run the installer** by visiting the file in your browser:  



You can add any php script by make setup.php file by follow rules.
[https://olsapp.olspanel.com/develop.php](https://olsapp.olspanel.com/develop.php)

---

## 🌟 Key Features

- ✅ One-click installation for popular PHP applications
- 🧩 Full WordPress management:
  - Install/Manage Plugins and Themes
  - Manage WordPress Users
  - View and control site metadata
- 🔁 **Clone WordPress installations** to a new domain or subfolder
- 💾 **Backup** WordPress site files + database in one click
- ♻️ **Restore** backups anytime from ZIP archive
- ⚙️ Works with **any PHP server** (Apache, Nginx, OpenLiteSpeed, etc.)
- 🧰 No panel dependency — can run standalone
- 🔐 100% free and open-source (MIT Licensed)

---

## 📸 Screenshots

### 🔧 OLSApp Dashboard

![OLSApp Dashboard](https://github.com/osmanfc/olsapp/blob/main/screenshorts/dashboard.png?raw=true)

### 🚀 One-click App Installer Interface

![App Installer](https://github.com/osmanfc/olsapp/blob/main/screenshorts/install.png?raw=true)

---

## 🔃 Clone, Backup & Restore Features

### 🔁 Clone Site
Easily duplicate any existing WordPress site to a new location. This is useful for:
- Creating staging or test sites
- Migrating between domains or directories

### 💾 Backup
Create a complete ZIP archive of:
- WordPress files (themes, plugins, uploads)
- WordPress database (`.sql` file included)

### ♻️ Restore
Upload and restore any backup archive made by OLSApp:
- Select the `.zip` backup
- Automatically extracts and imports files + database
- Restore WordPress site in seconds

---

## 📦 Supported Applications

**Blogs:** WordPress  
**CMS:** Joomla, Drupal, Silverstripe, ConcreteCMS  
**Forums:** phpBB  
**Frameworks:** Laravel, CodeIgniter  
**E-commerce:** PrestaShop, OpenCart  
**Project Management:** Kanboard

---

## 🧪 How to Use

1. Upload OLSApp to your server: `/public_html/olsapp/`
2. Visit: [https://olsapp.olspanel.com](https://olsapp.olspanel.com)
3. Use the menu to:
   - Install a new app
   - Manage WordPress sites
   - Clone, backup, or restore a WordPress installation

---

## ⚙️ Requirements

- PHP 7.4 or newer (PHP 8.x compatible)
- `ZipArchive`, `cURL`, and `PDO` PHP extensions
- Compatible with Apache, Nginx, OpenLiteSpeed, etc.
- Internet access for downloading app packages

---

## 📜 License

MIT License — Free for personal, commercial, and hosting provider use.

---

## 🌐 Project Links

🔗 Live Demo: [https://olsapp.olspanel.com](https://olsapp.olspanel.com)  
📁 GitHub Repo: [https://github.com/osmanfc/olsapp](https://github.com/osmanfc/olsapp)

---

## 🤝 Contribute

Pull requests, issues, and suggestions are welcome.  
Got a new app to suggest or a bug to report? [Open an issue](https://github.com/osmanfc/olsapp/issues).
