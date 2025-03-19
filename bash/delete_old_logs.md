# 🔥 Deleting Logs Older Than 7 Days

## 📌 Overview
Log files can take up a lot of space if not managed properly. To free up disk space and keep things tidy, we can **automatically
 delete logs older than 7 days** using the `find` command in Linux.

## 🛠 Command to Delete Old Logs
To remove all `.log` files in `/var/log/` that are **older than 7 days**, run:

```bash
find /var/log -type f -name "*.log" -mtime +7 -delete
```

### 📖 Explanation
- `find` → Searches for files.
- `/var/log` → The directory to search in.
- `-type f` → Finds only files (not directories).
- `-name "*.log"` → Targets files with a `.log` extension.
- `-mtime +7` → Selects files modified **more than 7 days ago**.
- `-delete` → Deletes the found files.

⚠ **Warning:** This permanently deletes the files. Double-check before running!

## ✅ Testing Before Deleting
If you want to preview the files **without deleting** them, use:

```bash
find /var/log -type f -name "*.log" -mtime +7
```

## 🔄 Automate with Cron Job
If you wish to schedule this cleanup **daily at midnight**, add this line to your crontab:

```bash
0 0 * * * find /var/log -type f -name "*.log" -mtime +7 -delete
```

Edit the crontab with:
```bash
crontab -e
```

## 🏆 Alternative Methods
Instead of deleting logs, you can:
1️⃣ **Move them to a backup folder:**
```bash
find /var/log -type f -name "*.log" -mtime +7 -exec mv {} /backup/logs/ \;
```

2️⃣ **Compress them to save space:**
```bash
find /var/log -type f -name "*.log" -mtime +7 -exec gzip {} \;
```

3️⃣ **Use `logrotate` to automate log management:**
Modify `/etc/logrotate.conf` to set up rotation rules.

---
**By using these methods, you can keep your system clean and prevent logs from consuming too much space! 🚀**

