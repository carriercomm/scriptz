#!/bin/bash
### Copyright (c) 2012 Remy van Elst
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.


#Change these values to your need
#Exclude hidden directories, 0=exclude,1=include
HIDDEN=0
#Time parameter in days for modified files
MTIME="-1"
#Directory to look for files, if unset use current dir
FILEDIR=$1
if [ -z "$FILEDIR" ]; then
FILEDIR="./";
fi
SVERSION="0.2"
HOSTPC=`hostname`
HOSTUSER=`whoami`

#Now do the  find thing

case "$HIDDEN" in

    0) echo "Reporting all files modified in last "$MTIME" period in directory "$FILEDIR" for system "$HOSTPC", running as user "$HOSTUSER" excluding hidden files."
    echo "Date: `date`"
    echo "START OF FILE REPORT"
    find $FILEDIR -type f -mtime $MTIME ! -path "*/.*" | xargs -r ls -lh 2>/dev/null
    echo "END OF FILE REPORT"
    echo "Report script version $SVERSION by raymii.org"
    ;;

    1) echo "Reporting all files modified in last "$MTIME" period in directory "$FILEDIR" for system "$HOSTPC", running as user "$HOSTUSER"."
    echo "Date: `date`"
    echo "START OF FILE REPORT"
    find $FILEDIR -type f -mtime $MTIME | xargs -r ls -lh 2>/dev/null
    echo "END OF FILE REPORT"
    echo "Report script version $SVERSION by raymii.org"
    ;;

esac
#END OF SCRIPT