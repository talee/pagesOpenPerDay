#!/bin/sh
DIR="histories/"
STOREDIR="records/"
DATE=$(date +'%b %d, %Y')
OUTPUTFILE=$DIR$DATE
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
unset POSIXLY_CORRECT
#. ~/.bashrc
. /etc/profile
. ~/.profile
cd "$( cd "$( dirname "$0" )" && pwd )"
tac ~/.opera-next/global_history.dat > global_history.dat
/usr/bin/gawk -f getTodayHistory.awk -- global_history.dat > "$OUTPUTFILE"
rm global_history.dat
/bin/sed -i -f removeExtraHistory.sed "$OUTPUTFILE"
echo -n "From "
# grep -Z doesn't remove newline for some reason or other... use tr then
tac "$OUTPUTFILE" | grep -o -m 1 '[0-9]\{2\}:[0-9]\{2\}[AP]M' | tr -d '\n'
echo -n " to "
/bin/grep -o -m 1 '[0-9]\{2\}:[0-9]\{2\}[AP]M' "$OUTPUTFILE"
echo -n "I opened about "
NUMLINES=$(cat "$OUTPUTFILE" | wc -l | tr -d '\n')
echo -n $NUMLINES
echo " web pages in the Opera browser."
find records/ -name "$DATE*" -print0 | xargs -0 rm
echo > $STOREDIR$DATE" - "$NUMLINES
