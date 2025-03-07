# Linux Commands Cheat Sheet

## 🔹 Basic Navigation Commands
- `pwd` → Print current working directory
- `ls` → List files in the current directory
- `cd <directory>` → Change directory

## 🔹 File Management
- `touch file.txt` → Create a new file
- `mkdir new_folder` → Create a new folder
- `rm file.txt` → Delete a file
- `rm -r folder` → Delete a folder and its contents
- `nano <filename>` → Opens the file in read and write mode(if permissions allow)
- `sudo` → (superuser do) Gives superuser commands to run commands that need administrative privileges

## 🔹 File Viewing
- `cat file.txt` → View file content
- `less file.txt` → View file with scrolling
- `head -n 10 file.txt` → Show first 10 lines
- `tail -n 10 file.txt` → Show last 10 lines

## 🔹 System Info
- `uname -a` → Show system info
- `df -h` → Check disk space usage
- `free -m` → Check memory usage

## 🔹 Package management 
We can use apt(newer) or apt-get/apt-cache(older): for using apt, it encapsulates the two options of apt-get and apt-cache into
just apt.
- `apt-get install <package-name>` or `apt install <package-name>` → Installs the package whose name is specified
- `apt-get remove <package-name>` → Removes the package whose name is specified if installed
- `apt-cache search <package-name>*` → It searches for available packages in your system's APT package cache that match the
 given name. The * wildcard allows for partial matches
- `apt-cache search <package-name>`
- `apt-cache policy <package-name>` → Shows the info(version etc) about the specified package
- `apt-get upgrade` > Updates all our packages

Many packages are available at the ubuntu repo and can easily be downloaded using this commands above but there are some 
packages/apps that you'll want to download using the terminal, that are not present there. Here's how we download;
- `sudo dpkg -i <path to the downloaded package>`

## File Permissions in Linux

Every file and directory has permissions for:
- `Owner (u)`
- `Group (g)`
- `Others (o)`

### 🔥 View File Permissions
```bash
ls -l
Example output:
-rw-r--r-- 1 user user 1234 Mar 2 12:34 myfile.txt
```
### 🛠 Changing Permissions
- Numeric Method
chmod 755 myfile.txt  # Owner full, group + others read & execute
chmod 644 myfile.txt  # Owner full, group + others read only
- Symbolic Method
chmod u+x script.sh   # Add execute for user
chmod g-w file.txt    # Remove write for group
chmod o+r file.txt    # Add read for others

### 🔄 Changing Ownership
chown user:group file.txt  # Change d group
sudo chown root:root script.sh  # Change owner to root

## Find files/directories

`find [path] [options] [expression]`

`` → The directory to start searching from (e.g., . for the current directory).

`` → Filters like file type, permissions, modification time, etc.

`` → Defines what to look for (e.g., -name "*.php").

Finding Files and Directories

### Find Files with a Specific Extension

`find . -type f -iname "*.php"`

. → Searches from the current directory.

-type f → Searches for files only (use -type d for directories).

-iname "*.php" → Searches for files with a .php extension, case-insensitive (-name is case-sensitive).

### Find Directories Matching a Pattern

`find . -type d -iname "config*"`

Finds directories that start with "config".


### Find by Permissions

`find . -type f -perm 644`

Finds files with 644 permissions (owner can read/write, others can only read).

### Find and Execute a Command

`find . -type f -iname "*.php" -exec ls -lh {} \;`

-exec → Runs a command on each result.

{} → Represents each found file.

\; → Marks the end of the -exec command.This could also be `+` and as a matter of fact the latter is more efficient and it 
groups the command and executes as one rather than executing seperatelt for each file.

### Find and Delete Files

`find . -type f -iname "*.log" -delete`

Deletes all .log files in the current directory and subdirectories.

### Find Files Modified Recently

`find . -type f -mtime -7`

- Finds files modified in the last 7 days.

`find . -type f -mmin -30`

- Finds files modified in the last 30 minutes.
### Find files by size

`find . -type f -name "*php" -size +50k`

- Finds file with name extension php and file size over 50kb

## Search for Text Inside Files
- `grep "search_term" file.txt` - Finds occurrences of `"search_term"` inside `file.txt`.
- `grep -i "search_term" file.txt` - Case-insensitive search (`-i` ignores case).
- `grep -n "search_term" file.txt` - Shows line numbers (`-n` displays line numbers where matches are found).
- `grep -r "search_term" /path/to/dir` - Recursively searches inside all files in a directory.
- `grep -l "search_term" *.txt` - Lists only file names containing the search term.
- `grep -v "search_term" file.txt` - Shows lines **not** containing `"search_term"` (`-v` inverts the match).

### **Combining Flags**
You can combine flags for more advanced searches:
```bash
grep -i -n "error" logfile.txt
```

This will search for "error" inside logfile.txt, ignoring case and showing line numbers.
## Process and service  management
- `top` - to see all running processes in real time
- `ps aux` - to see all running processes at the time the command is being run
- `kill -9 <PID>` - to kill the process with the specified PID
- `killall <name>` - kill all process with the name
- `sudo systemctl start elasticsearch`  # Start the service
- `sudo systemctl stop elasticsearch`   # Stop the service
- `sudo systemctl status elasticsearch` # Check status


