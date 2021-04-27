#! /bin/bash
recurse () {
    local dir=$1
    for f in "$dir"/* ; do
        if [[ -f $f ]] ; then
           echo "<ul class="ul3">" >> $OUTPUT
    	   filename=$(basename "$f")
    	   echo "<li class="li2"><a href="$f">$filename</a></li></ul>" >> $OUTPUT
        fi
        if [[ -d $f ]] ; then
            echo "<ul class="ul2">" >> $OUTPUT
            BASEDIR=$(readlink -f "$f")
            echo "<li class="li1"><span class="s1"></span><span class="s2">$BASEDIR/<span class="Apple-converted-space"> </span></span></li>" >> $OUTPUT
            recurse "$f"
            echo "</ul>" >> $OUTPUT
        fi
    done
}

FILES=$HOME
OUTPUT="filetree.html"

## When the first argument is not a directory or a folder or it does not exist
if ! [ -d "$FILES" ]; then
   echo "Error: $FILES is not a directory and/or a folder! Or it doesn't exist!"
   exit 1
fi
## When the permission to read for given argument directory is not allowed
if ! [ -r "$FILES" ] ; then
   echo "Error: '$FILES' (a directory and/or a folder) is not allowed to read!"
   exit 1
fi
## When the given argument directory is empty
if [ ! "$(ls -A "$FILES")" ]; then
   echo "Error: $FILES is empty directory!"
   exit 1
fi

echo "<!DOCTYPE html>" >> $OUTPUT
echo "<html>" >> $OUTPUT
echo "<head>" >> $OUTPUT
echo "<title>ECE3524_Project3_AnnaYu</title>" >> $OUTPUT
echo "<style type="text/css">" >> $OUTPUT
echo "li.li1 {margin: 0.0px 0.0px 0.0px 0.0px; font-family: Helvetica; color: #000000; -webkit-text-stroke: #000000}" >> $OUTPUT
echo "li.li2 {margin: 0.0px 0.0px 0.0px 0.0px; font-family: Helvetica; color: #0000e9}" >> $OUTPUT
echo "span.s1 {-webkit-text-stroke: 0px #000000}" >> $OUTPUT
echo "span.s2 {font-kerning: none}" >> $OUTPUT
echo "span.s3 {text-decoration: underline ; font-kerning: none; -webkit-text-stroke: 0px #0000e3}" >> $OUTPUT
echo "span.s4 {text-decoration: underline ; font-kerning: none; color: #0000e3}" >> $OUTPUT
## For the base directory, list type is squre
## For all directory types except base directory, list type is circle
## For all file types, list type is disc
echo "ul.ul1 {list-style-type: square}" >> $OUTPUT
echo "ul.ul2 {list-style-type: circle}" >> $OUTPUT
echo "ul.ul3 {list-style-type: disc}" >> $OUTPUT
## Mousr moving, file linke is blue, if your visited file, it turns red
## When you put mouse on file link, it truns green. While clicking file link, it turns pink.
echo "a:link {color: blue;}" >> $OUTPUT
echo "a:visited {color: red;}" >> $OUTPUT
echo "a:hover {color: green;}" >> $OUTPUT
echo "a:active {color: hotpink;}" >> $OUTPUT
echo "</style>" >> $OUTPUT
echo "</head>" >> $OUTPUT
echo "<body>" >> $OUTPUT
echo "<ul class="ul1">" >> $OUTPUT
echo "<h1 style="font-family:Helvetica">ECE 3524 Project 3 - 8. My Home File-tree</h1>" >> $OUTPUT
echo "<h2 style="font-family:Helvetica">- Script runs and html is generated in ${PWD}</h2>" >> $OUTPUT
echo "<h2 style="font-family:Helvetica">- Directory Hierarchy starts from $FILES</h2>" >> $OUTPUT
echo "<li class="li1"><span class="s1"></span><span class="s2">$FILES<span class="Apple-converted-space"> </span></span></li>" >> $OUTPUT

recurse $FILES

echo "</ul>" >> $OUTPUT
echo "</body>" >> $OUTPUT
echo "</html>" >> $OUTPUT
