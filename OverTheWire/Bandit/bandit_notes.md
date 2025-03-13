# OverTheWire Bandit Notes

## Level 0 → Level 1
**Goal:** Find the password in the `readme` file. Disconnect from the bandit0 and reconnect to ssh bandit1
```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

**Commands Used:**
```bash
ls      # Lists files
cat readme  # Reads the content of the file
```
- The password in it is - ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

## Level 1 -> Level 2
**Goal:** Open the file present and get the password character within

```bash
- ls : to see the file content (the file is named -)
```
To read a dash file, we need to specify the filepath of the file like;
```bash
cat ./- # the file is named - and we specify the abs loc or path of the file to be able to open it
```
- The password gotten in it is - 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
