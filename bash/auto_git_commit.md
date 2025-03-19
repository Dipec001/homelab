🚀 Automated Git Commit & Push Every 10 Minutes
📅 Date: 3/19/25
👤 Author: Dipec
💻 System: Linux (Ubuntu)

1️⃣ Why Automate Git Commits?
Keeping track of changes in a Git repository is crucial for version control. Automating commits ensures:

✅ No lost work due to forgetfulness
✅ Frequent backups of your codebase
✅ Continuous tracking of modifications

🛠 Setting Up the Automation
📌 Step 1: Create the Bash Script
We'll create a script that:

- Adds all changes
- Commits with a timestamp
- Pushes to the repository

Create a file named auto_git_commit.sh and add the following:

```bash
#!/bin/bash
```

# Navigate to the Git repository
cd /path/to/your/repo || exit 1  # Ensure the script exits if the directory isn't found

# Stage, commit, and push changes
git add -A
git commit -m "Automated commit: $(date)"
git push origin main  # Change 'main' if your branch is different

🔹 Make the script executable:

```bash
chmod +x auto_git_commit.sh
```
📌 Step 2: Add a Cron Job
Now, we'll schedule this script to run every 10 minutes using cron.

Open your crontab editor:

```bash
crontab -e
```
Add the following line at the bottom:

```bash
*/10 * * * * /path/to/auto_git_commit.sh >> /path/to/git_autocommit.log 2>&1
```
📌 Explanation:

*/10 * * * * → Runs the script every 10 minutes
/path/to/auto_git_commit.sh → Calls our script
>> /path/to/git_autocommit.log 2>&1 → Logs output & errors

🗂 Additional Notes
✅ Using SSH for Authentication
To avoid entering passwords manually, set up SSH authentication for Git:

```bash
ssh-keygen -t rsa -b 4096 -C "dpecchukwu@gmail.com"
```
Then add the key to GitHub:

```bash
cat ~/.ssh/id_rsa.pub
```

Go to GitHub → Settings → SSH Keys and paste it.

✅ Checking Your Git Config
Ensure your Git is configured correctly:

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```
🎯 Final Thoughts
With this setup, your Git repository will automatically commit and push changes every 10 minutes—ensuring nothing is lost and changes are continuously tracked.

🚀 Your workflow is now fully automated!


