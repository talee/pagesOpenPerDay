#!/bin/bash
#
#  Stores how much web pages I open each day in Opera. Why not.
#  (Also stores actual history - not tracked)
#
#  Author: Thomas Lee
#  Date:   May 30, 2012
#
DIR="histories/"
STOREDIR="records/"
DATE=$(date +'%b %d, %Y')
OUTPUTFILE=$DIR$DATE
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
unset POSIXLY_CORRECT
. /etc/profile
. ~/.profile
# Change to script directory
cd "$( cd "$( dirname "$0" )" && pwd )"

# Extract today's history and store it, updating today's entries if they exist
find histories/ -name "$DATE*" -print0 | xargs -0 rm
tac ~/.opera-next/global_history.dat | /usr/bin/gawk -f getTodayHistory.awk > "$OUTPUTFILE"
/bin/sed -i -f removeExtraHistory.sed "$OUTPUTFILE"
NUMLINES=$(cat "$OUTPUTFILE" | wc -l | tr -d '\n')
OLDFILE="$OUTPUTFILE"
OUTPUTFILE="$OUTPUTFILE"\ -\ "$NUMLINES"
mv "$OLDFILE" "$OUTPUTFILE"

# Output time range of history
echo -n "From "
# Get the first page time
# grep -Z doesn't remove newline for some reason or other... use tr then
tac "$OUTPUTFILE" | grep -o -m 1 '[0-9]\{2\}:[0-9]\{2\}[AP]M' | tr -d '\n'
echo -n " to "
# Get the last page time
/bin/grep -o -m 1 '[0-9]\{2\}:[0-9]\{2\}[AP]M' "$OUTPUTFILE"
echo -n "I opened about "
echo -n $NUMLINES
echo " web pages in the Opera browser."

# Remove any old records for today and store number of pages visited
find records/ -name "$DATE*" -print0 | xargs -0 rm
echo > "$STOREDIR$DATE"\ -\ "$NUMLINES"
