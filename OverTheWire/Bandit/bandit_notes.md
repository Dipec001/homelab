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
- ls : to see the file name (the file is named -)
```
To read a dash file, we need to specify the filepath of the file like;
```bash
cat ./- # the file is named - and we specify the abs loc or path of the file to be able to open it
```
- The password gotten in it is - 263JGJPfgU6LtdEvgfWU1XP5yac29mFx

## Level 2 -> Level 3
**Goal:** Open a file with spaces in the filename such as "file with name space"

```bash
- ls : to see the file name (the file is named "file with name space")
```
To read or open a file with spaces in the name, we need to insert them in a quote or escape the space '\'"

```bash
cat "file with name space"
``` 
OR
```bash
cat file\ with\ name\ space
```

- The password in this file is - MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
## Level 3 -> Level 4
** Goal:** Get the password from a hidden file inside a dir called inhere

```bash
ls -a inhere # to see the content of the inhere dir with the hidden file
```
The name of the hidden file is '...Hiding-From-You'

```bash
cat ...Hiding-From-You # to see the content of the file
```
- The password in this file is - 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ

## Level 4 -> Level 5
**Goal:** Get the password from the only human readable file in the dir inhere

```bash
file * # this will show the file type of all the files inthe inhere dir
#+ for this particular case all the file names start with a - e.g '-file00'
#+ so to open it we would use file */ or file -- *
```
- Files with the type ASCII text are humanly readable
REsult of the file ./*
./-file00: data
./-file01: data
./-file02: data
./-file03: data
./-file04: data
./-file05: data
./-file06: data
./-file07: ASCII text
./-file08: data
./-file09: data

To get the content of the file '-file07', i use;
```bash
cat -- -file07  # the -- makes the command know that the file name starting -f is not a flAG and should be treated as name
```
- The password in this file is - 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw

