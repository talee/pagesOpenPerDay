#!/bin/sh
DIR="histories/"
STOREDIR="records/"
DATE=$(date +'%b %d, %Y')
OUTPUTFILE=$DIR$DATE
cp ~/.opera-next/global_history.dat .
awk -f getTodayHistory.awk -- global_history.dat > "$OUTPUTFILE"
rm global_history.dat
sed -i -f removeExtraHistory.sed "$OUTPUTFILE"
echo -n "From "
# grep -Z doesn't remove newline for some reason or other... use tr then
grep -o -m 1 '[0-9]\{2\}:[0-9]\{2\}[AP]M' "$OUTPUTFILE" | tr -d '\n'
echo -n " to "
tac "$OUTPUTFILE" | grep -o -m 1 '[0-9]\{2\}:[0-9]\{2\}[AP]M'
echo -n "I opened about "
NUMLINES=$(cat "$OUTPUTFILE" | wc -l | tr -d '\n')
echo -n $NUMLINES
echo " web pages in the Opera browser."
find records/ -type f -print0 -name '$DATE*' | xargs -0 rm
echo > $STOREDIR$DATE" - "$NUMLINES
