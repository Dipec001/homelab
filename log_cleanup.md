## **Automated Log Cleanup in My Homelab Using Cron**

**Date:** *3/5/25*  
**Author:** *Dipec*  
**System:** Ubuntu 24.04

---

## **1️⃣ Why Clean Logs?**
Log files in `/var/log/` can grow large over time, consuming disk space. To prevent this, I set up an automated cleanup task to clear logs **every Sunday at 3 AM**.

---

## **2️⃣ The Cron Job I Used**
I created a cron job to clear these log files:
- `/var/log/syslog`
- `/var/log/auth.log`
- `/var/log/kern.log`
- `/var/log/dmesg`

The cron job:
```bash
0 3 * * 0 truncate -s 0 /var/log/syslog /var/log/auth.log /var/log/kern.log /var/log/dmesg
```
This **runs every Sunday at 3 AM** and empties the log files while keeping them intact.

---

## **3️⃣ How I Set It Up**
1. Open the crontab editor:
   ```bash
   crontab -e
   ```
2. Add this line at the bottom:
   ```bash
   0 3 * * 0 truncate -s 0 /var/log/syslog /var/log/auth.log /var/log/kern.log /var/log/dmesg
   ```
3. Save and exit.

---

## **4️⃣ How It Works**
| Cron Field  | Value | Meaning |
|------------|------|---------|
| Minute     | `0`  | Runs at the **start** of the hour |
| Hour       | `3`  | Runs at **3 AM** |
| Day of Month | `*`  | Runs **every day of the month** |
| Month      | `*`  | Runs in **every month** |
| Day of Week | `0`  | Runs **only on Sundays** (0 = Sunday) |

The `truncate -s 0` command sets the file size to **0 bytes**, clearing the log but keeping the file.

---

## **5️⃣ How to Check If It Works**
- After **Sunday at 3 AM**, check if the logs are empty:
  ```bash
  ls -lh /var/log/syslog
  ```
  If it shows `0 bytes`, it's working.
- Manually run it to test:
  ```bash
  sudo truncate -s 0 /var/log/syslog
  ```

---

## **6️⃣ Alternative: Using Logrotate**
Instead of truncating logs, I could use `logrotate`:
1. Edit the logrotate config:
   ```bash
   sudo nano /etc/logrotate.d/mylogs
   ```
2. Add:
   ```
   /var/log/syslog /var/log/auth.log /var/log/kern.log /var/log/dmesg {
       weekly
       rotate 4
       compress
       missingok
       notifempty
   }
   ```
3. Save and exit.

This would **rotate logs weekly**, keeping 4 backups and compressing old ones.

---

## **7️⃣ Lessons Learned**
✅ Cron jobs are easy to automate tasks.  
✅ `truncate -s 0` is better than `rm` because it keeps log files intact.  
✅ I should monitor logs before deleting them to avoid missing critical info.  
✅ `logrotate` is a more structured alternative for managing logs.

---

## **8️⃣ Future Improvements**
- Set up `logrotate` instead of manual truncation.  
- Send a notification before logs are cleared.  
- Monitor logs with a dashboard like **Grafana** or **ELK Stack**.

---

📌 **Now my homelab automatically cleans logs every week! 🚀**
