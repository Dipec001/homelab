# **🚀 Low Disk Space Alert Automation in My Homelab**  

**📅 Date:** *3/7/25*  
**👤 Author:** *Dipec*  
**💻 System:** Ubuntu 24.04  

---

## **1️⃣ Why Monitor Disk Space?**  
Disk space is crucial in a homelab environment. If the root (`/`) partition runs low, it can lead to:  
✅ System crashes  
✅ Failed updates  
✅ Lost data  

To prevent this, I automated a **disk space check** that sends an **email alert when available space is below 10GB threshold**.

---

## **2️⃣ The Bash Script (`check-disk.sh`)**  
I wrote a **simple Bash script** to monitor disk space and send an email alert if space is running low.  

```bash
#!/bin/bash

# Set the threshold (10GB)
THRESHOLD=10

# Get available space on root (/), in GB
AVAILABLE=$(df -BG / | awk 'NR==2 {print $4}' | sed 's/G//')

echo "Available space: $AVAILABLE GB"

# If available space is less than the threshold, send an email
if [ "$AVAILABLE" -lt "$THRESHOLD" ]; then
    echo -e "Subject: Low Disk Space Alert\n\nWarning! Disk space is low. Only $AVAILABLE GB left." | msmtp -t dpecchukwu@gmail.com
fi
```

🔹 What This Script Does:
✔ Checks free space on / (root) in GB
✔ Compares it to the 10GB threshold
✔ Sends an email alert using msmtp if space is low

3️⃣ How I Set It Up

1️⃣ Make the Script Executable
bash
```
chmod +x check-disk.sh
```

2️⃣ Test It Manually
bash
```
./check-disk.sh
```

3️⃣ Automate It with Cron
I set up a cron job to run the script every hour and notify me when space is low.

🔧 Edit the cron jobs:

bash
```
crontab -e
```

📌 Add this line at the bottom:

bash
```
0 * * * * /path/to/check-disk.sh
```

🔹 How It Works:

Cron Field	Value	Meaning
Minute	0	Runs at the start of the hour
Hour	*	Runs every hour
Day of Month	*	Runs every day
Month	*	Runs every month
Day of Week	*	Runs every day of the week

4️⃣ Email Alert Example 📩
✅ Here’s the email I received when disk space was low:
![lowdiskalert](https://github.com/user-attachments/assets/fbe0bd24-6840-428d-a53a-0a05c9f9662d)



💡 I can check emails on my server using:

bash
```
cat /var/mail/dipec
```

5️⃣ Lessons Learned 🎯
✅ Automating system monitoring prevents downtime.
✅ df -BG is a simple and effective way to check free space.
✅ msmtp is a great lightweight email sender.
✅ Cron jobs make life easier by running tasks on schedule.

6️⃣ Future Improvements 🔮
🚀 Integrate with Zabbix or Prometheus for better monitoring.
🚀 Send a Telegram notification instead of email.
🚀 Auto-clean logs & old files if space gets too low.

📌 Now my homelab warns me when disk space is low! 🚀
