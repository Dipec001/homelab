# **📌 Bash Scripting Basics - What I Learned**

**Date:** *3/7/25*  
**Author:** *Dipec*  
**System:** Ubuntu 24.04  

---

## **1️⃣ Echo - Printing Output**
The `echo` command prints text to the terminal.
```bash
echo "Hello, World!"
```
Output:
```
Hello, World!
```

---

## **2️⃣ Variables in Bash**
Variables are assigned without spaces around `=`.
```bash
name="Dipec"
echo "My name is $name"
```
Output:
```
My name is Dipec
```

---

## **3️⃣ Arguments in Bash Scripts**
Bash scripts can take arguments from the command line.
```bash
#!/bin/bash
name=$1
compliment=$2
echo "Hello, $name! You are $compliment."
```
Run it:
```bash
bash script.sh Dipec awesome
```
Output:
```
Hello, Dipec! You are awesome.
```

---

## **4️⃣ User Input (`read`)**
The `read` command takes input from the user.
```bash
read -p "Enter your name: " username
echo "Hello, $username!"
```

---

## **5️⃣ Creating Environment Variables (`export`)**
Temporary environment variables can be set using `export`.
```bash
export MY_VAR="Hello"
echo $MY_VAR
```

To make it permanent, add it to `.bashrc`:
```bash
echo 'export MY_VAR="Hello"' >> ~/.bashrc
```

---

## **6️⃣ Exit Status (`exit 1`)**
`exit 1` stops script execution and signals an error.
```bash
if [ ! -f "/etc/passwd" ]; then
  echo "File not found!"
  exit 1
fi
```

---

## **7️⃣ Case Statement**
The `case` statement is used for multiple conditions.
```bash
read -p "Enter a number (1-3): " num
case $num in
  1) echo "You chose one!" ;;
  2) echo "You chose two!" ;;
  3) echo "You chose three!" ;;
  *) echo "Invalid choice!" ;;
esac
```

---

## **8️⃣ If Statements**
```bash
x=10
if [ $x -gt 5 ]; then
  echo "x is greater than 5"
fi
```

---

## **9️⃣ While Loop**
Repeats while a condition is true.
```bash
x=1
while [ $x -le 5 ]; do
  echo "x = $x"
  (( x++ ))
done
```

---

## **🔟 Until Loop**
Runs until the condition becomes true.
```bash
y=0
until [ $y -eq 5 ]; do
  echo "$y"
  (( y++ ))
done
```

---

## **1️⃣1️⃣ For Loop**
Iterates over a sequence.
```bash
for i in {1..5}; do
  echo "Number: $i"
done
```

---

## **1️⃣2️⃣ Break Statement**
Stops a loop early.
```bash
for i in {1..5}; do
  if [ $i -eq 3 ]; then
    break
  fi
  echo "i = $i"
done
```
Output:
```
i = 1
i = 2
```

---

## **1️⃣3️⃣ Continue Statement**
Skips the current iteration and moves to the next one.
```bash
for i in {1..5}; do
  if [ $i -eq 3 ]; then
    continue
  fi
  echo "i = $i"
done
```
Output:
```
i = 1
i = 2
i = 4
i = 5
```

---

## **1️⃣4️⃣ Bash Operators**
| Operator | Meaning |
|----------|---------|
| `-eq` | Equal to |
| `-ne` | Not equal to |
| `-lt` | Less than |
| `-le` | Less than or equal to |
| `-gt` | Greater than |
| `-ge` | Greater than or equal to |
| `&&` | AND condition |
| `||` | OR condition |
| `!` | NOT condition |

📌 **Example:**
```bash
x=10
y=5
if [[ $x -gt 5 && $y -lt 10 ]]; then
  echo "Both conditions are true."
fi
```

---

## **Conclusion**
✅ Learned the basics of Bash scripting!  
✅ Now ready to automate tasks in my homelab! 🚀

