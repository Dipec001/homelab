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
chown user:group file.txt  # Change owner and group
sudo chown root:root script.sh  # Change owner to root

