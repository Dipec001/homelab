# 🚀 Automated Git Repository Creation, Commit & Push Using GitHub API

📅 **Date:** `$(date +'%m/%d/%y')`  
👤 **Author:** Dipec  
💻 **System:** Ubuntu 24.04  

---

## 🔹 Why Automate Git Repository Creation?  

Setting up a Git repository manually can be time-consuming. This script automates the entire process:  

✅ **Creates a new GitHub repository using the API**  
✅ **Initializes a local Git repository**  
✅ **Commits a file**  
✅ **Pushes it to GitHub**  

---

## 🛠 Prerequisites  

Before running the script, make sure you have:  

- A **GitHub Personal Access Token (PAT)** with `repo` permissions  
To get it;
Go to GitHub Token Settings
Click "Generate new token" (or "Generate new token (classic)")
Select repo scope and generate

- `git` and `curl` installed  
- A GitHub username  

---

## 📜 The Bash Script  

#!/bin/bash

# 🔹 Set variables
GITHUB_USER="Dipec001" # My Github Username
REPO_NAME="newrepo"  # The repository name you want to create
TOKEN="ghp_yourpersonalaccesstoken"  # Replace with your GitHub Personal Access Token
GIT_URL="https://github.com/$GITHUB_USER/$REPO_NAME.git"

# 1️⃣ Create GitHub repository using API
curl -H "Authorization: token $TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     https://api.github.com/user/repos \
     -d "{\"name\":\"$REPO_NAME\"}"

# 2️⃣ Initialize the local repository
mkdir $REPO_NAME && cd $REPO_NAME
git init

# 3️⃣ Create a README file
echo "# $REPO_NAME" >> README.md

# 4️⃣ Stage and commit the file
git add README.md
git commit -m "Initial commit"

# 5️⃣ Set up the remote repository
git branch -M main
git remote add origin $GIT_URL

# 6️⃣ Push to GitHub
git push -u origin main

echo "🚀 Repository '$REPO_NAME' successfully created and pushed to GitHub!"


📌 Conclusion
This script simplifies the process of creating, committing, and pushing to GitHub in just a single command! 💪
