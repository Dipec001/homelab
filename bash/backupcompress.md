#!/bin/bash

🚀 Automated Directory Backup & Compression in My Homelab

📅 Date: 3/19/25👤 Author: Dipec💻 System: Ubuntu 24.04

1️⃣ Why Backup & Compress?

Keeping backups is essential to protect important data in a homelab. 
Compressing backups:
✅ Saves storage space✅ Makes it easier to transfer files✅ Helps restore data quickly in case of failure

- To check the space of the disk of the original and the backup dir, we can use the *du* command.

🗂 Understanding du command
The du command stands for Disk Usage and is used to check how much space a file or directory is consuming.

Running du -sh on a directory shows its total size in a human-readable format.
Example:
```bash
du -sh homelab
```
# Output: 1.1M    homelab
```bash
du -sh homelab.tar.gz
```
# Output: 120K    homelab.tar.gz
This means the compressed file (.tar.gz) is much smaller than the original directory, showing that compression saved a lot of
space. 🚀
Flags used:

-s → Summarize total size
-h → Human-readable output

2️⃣ The Bash Script (backup.sh)

This script backs up a directory, compresses it into a .tar.gz archive, and stores it in a backup folder.

#!/bin/bash

# Define backup source and destination
BACKUP_DIR="/path/to/directory" # This is the dir i want to backup
DEST_DIR="/backup/location"       # This is the backup storage location
FILENAME="backup-$(date +%F-%H%M).tar.gz"

# Create a compressed backup
tar -czvf "$DEST_DIR/$FILENAME" "$BACKUP_DIR"

This command creates a compressed backup using tar with the following options:

-c → Create a new archive
-z → Compress the archive using gzip (.tar.gz format)
-v → Verbose mode (lists files as they are added)
-f → Specify the filename of the archive

# Print success message
echo "Backup completed: $DEST_DIR/$FILENAME"

🔹 What This Script Does:
✔ Creates a timestamped backup file (e.g., backup-2025-03-07-1200.tar.gz)
✔ Compresses the entire directory to save space
✔ Stores the backup in the specified location

3️⃣ How I Set It Up

1️⃣ Make the Script Executable

chmod +x backup.sh

2️⃣ Test It Manually

./backup.sh

3️⃣ Automate It with Cron

I set up a cron job to run the script daily at midnight.

🔧 Edit the cron jobs:

crontab -e

📌 Added this line at the bottom:

0 0 * * * /path/to/backup.sh


* Restore Backup 🛠️

If I ever need to restore a backup:

tar -xzvf /backup/location/backup-2025-03-07-1200.tar.gz -C /restore/location

✅ -x: Extract✅ -z: Decompress✅ -C: Extract to a specific directory

5️⃣ Future Improvements 🔮

🚀 Encrypt backups for added security
🚀 Sync backups to a cloud storage (Google Drive, S3)
🚀 Add log rotation to keep backups manageable

📌 Now my homelab automatically backs up and protects my important files! 
