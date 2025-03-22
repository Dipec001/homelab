
# Log the execution to a file
echo "Auto-commit ran at $(date)" >> /home/dipec/cron-log.txt

#!/bin/bash  
if [ -n "$(git status --porcelain)" ]; then  
    git add .  
    git commit -m "Auto-commit $(date)"  
    git push origin main  
else  
    echo "No changes to commit 🚀"  
fi  
