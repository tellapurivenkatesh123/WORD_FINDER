# WORD_FINDER
# 🔍 FIND — Word Finder and Replacer (Bash Script)

## 📜 Description

**FIND** is a Bash script that searches for a specific word in a text file — across all letter case variations — and allows you to interactively choose which form(s) to replace.

It supports:
- Lowercase (`hello`)
- Capitalized/First letter case (`Hello`)
- Uppercase (`HELLO`)

You can then choose which version(s) to replace and provide a new replacement word.  
The script will automatically update the file using `sed`.

---

## ⚙️ Features

✅ Detects all **case variations** of a word  
✅ Lets you **choose** which variant to replace  
✅ Safely checks if the file exists before modifying  
✅ Uses **sed** for in-place replacement  
✅ Clear and user-friendly terminal interface  

---

## 🧩 Example

### Input file (`file.txt`)

```
hello world  
Hello everyone  
HELLO FRIENDS
```

### Run the script

```bash
$ ./find.sh
```

### Output

```
FFFFFFFFF   IIIIIIIII   NNN         NNN   DDDDDDDDDDD
FFFFFFFFF   IIIIIIIII   NNN N       NNN   DDDDDDDDDDDD
FFF            III      NNN  N      NNN   DDD       DDDD
FFF            III      NNN   N     NNN   DDD       DDDDD
FFFFFFFFF      III      NNN    N    NNN   DDD       DDDDD
FFFFFFFFF      III      NNN     N   NNN   DDD       DDDD
FFF            III      NNN      N  NNN   DDD       DDDD
FFF         IIIIIIIII   NNN       N NNN   DDDDDDDDDDDD    
FFF         IIIIIIIII   NNN         NNN   DDDDDDDDDDDD
=========================
find the word and replace
=========================
Enter the word :hello
Enter the filename:file.txt
checking for occurrences...
✔ Found lower case: hello
✔ Found first case: Hello
✔ Found upper case: HELLO
Select the options to replace:
1. lower (hello)
2. first (Hello)
3. upper (HELLO)
0. EXIT
Enter your choice:1
ENTER THE REPLACEMENT FOR 'hello':hi
✅ Replaced 'hello' with 'hi'.
```

---

## 🧠 How It Works

1. Prompts the user for a **word** and **filename**.  
2. Checks if the file exists.  
3. Generates three variations of the word:
   - Lowercase
   - Capitalized (first letter)
   - Uppercase  
4. Searches for each variation using `grep`.  
5. Lists all found variations and allows user to:
   - Select which one(s) to replace
   - Provide a new replacement word  
6. Updates the file using `sed -i`.

---

## 💻 Usage

```bash
chmod +x find.sh     # Make the script executable
./find.sh            # Run the script
```

---

## ⚠️ Notes

- The script **modifies files directly** — make a backup if needed.  
- Works best with **plain text files**.  
- Requires Bash version **4.0+** (for associative arrays).  

---

## 📂 Example Directory Structure

```
find.sh
file.txt
README.md
```

---

## 🧾 License

This project is open source and free to use for learning and automation purposes.  
Author: **VENKATESH TELLAPURI**