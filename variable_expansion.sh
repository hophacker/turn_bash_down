#!/bin/bash - 

source helper.sh
cd test_dir/
multi_line_string="Hello,
Bash.
Hello,
World."
string="to be, or not to be?"
# list files for this directory
# a.txt b.txt c.txt
bad_files_list=* 
files_list=(*)

cp '1(?)' $multi_line_string            "Hello,"

cp '2(?)'  "$multi_line_string"         "Hello, Bash. Hello, World."

cp 2  "$bad_files_list"                 "*"

cp 3  "$files_list"                     "a.txt"

left="${files_list[@]}"
cp 4  "$left"                           "a.txt b.txt c.txt"

cp 5  "${string:0:5}"                   "to be"

cp 6  "${string:5:4}"                   ", or"

left="${files_list[@]:1:2}"
cp 7  "$left"                           "b.txt c.txt"

# Case 8:  Length of an array
cp 8  "${#files_list[@]}"               3

# Case 9:  Remove suffix
cp 9  "${string%, or not to be?}"       "to be"

# Case 10: Remove suffix as much as possible
cp 10 "${string%%be*}"                  "to "

# Case 11: Remove prefix
cp 11 "${string#to be, }"               "or not to be?"

# Case 12: Remove prefix as much as possible
cp 12 "${string##*be}"                  "?"

# Case 13: Upcase the fist letter
cp 13 "${string^}"                      "To be, or not to be?"

# Case 14: Upcase the whole string
cp 14 "${string^^}"                     "TO BE, OR NOT TO BE?"

# Case 15: Upcase the first letter of each file name
left="${files_list[@]^}"
cp 15 "$left"                           "A.txt B.txt C.txt"

# Case 16: Upcase each file name
uppercase_files="${files_list[@]^^}"
cp 16 "$uppercase_files"                "A.TXT B.TXT C.TXT"

# Case 17: Use . to lower case, and it work the same way as ^
lowercase_files="${files_list[@]^^..}"
cp 17 "$lowercase_files"                "a.txt b.txt c.txt"

# Case 18: Use ~ to swap the case
uppercase_files="${files_list[@]~~}"
cp 18 "$uppercase_files"                "A.TXT B.TXT C.TXT"

# Case 19: Substitution (only the first one)
cp 19  "${string/be/die}"               "to die, or not to be?"

# Case 20: Substitution for all
cp 20  "${string//be/die}"              "to die, or not to die?"

# Case 21: Substitute prefix
cp 21  "${string/#not to/to}"           "to be, or not to be?"

# Case 22: Substitute suffix
cp 22  "${string/%to be?/to die?}"      "to be, or not to die?"

# Case 23: Show message if the variable is undefined
undefined=
cp 23  "${undefined:-It is undefined}"  "It is undefined"

# Case 24: Show message if the variable is defined
defined=true
cp 24  "${defined:+It is defined}"      "It is defined"


# Case 25, 26: Define the variable if it is undefined
cp 25  "${undefined:="It is good now"}" "It is good now"

cp 26  "${defined:="It is good now"}"   true

# Case 27: Throw an error if it is undefined
undefined=
echo "Below will throw an error because it is undefined:"
echo "${undefined:?What?}"            

cd ..

