#!/bin/bash

shopt -s globstar

/usr/bin/which readpst &>/dev/null
if [ "$?" -ne 0 ]; then
    echo "libpst not installed. Run first: yum install libpst "
    exit
fi

if [ "$#" -ne 2 ]; then
    echo "Usage: pst2webtop.sh <filename.pst> <user>"
    exit
fi

dir=`mktemp -d` 
newdir=`mktemp -d` 

mkdir -p /var/lib/nethserver/vmail/$2/Maildir/

if [ -f $1 ]; then
    readpst -o $dir -r $1
else
    echo "File not found: $1"
    exit
fi


cd $dir
for f in **/mbox; do mkdir -p "$newdir/$(dirname "$f")"; mv "$f" "$newdir/$(dirname "$f").mbox" ; done

/usr/share/webtop/doc/mb2md.pl -s $newdir -R -d /var/lib/nethserver/vmail/$2/Maildir/ -r mbox

chown -R vmail.vmail /var/lib/nethserver/vmail/$2/Maildir/

cd $dir
for f in **/calendar; do echo "Events Folder found: $f"; echo "    Import to webtop: "; echo "./pst2webtop_cal.php $2 '$dir/$f' <foldername>" ; echo ; done
for f in **/contacts; do echo "Contacts Folder found: $f"  ; echo "    Import to webtop: "; echo "./pst2webtop_card.php $2 '$dir/$f' <foldername>" ; echo ; done

