# /usr/bin/awk -f
# Preserve Opera history entries with today's date. Assumes reversed file.

BEGIN {
    # Get today's day of the month
    today = strftime("%b %d, %Y",systime());
}
{
    priority  = $0;
    getline;
    date      = $0;
    getline;
    URL       = $0;
    getline;
    title     = $0;

    # Replace Unix Epoch time with month day, year
    day = strftime("%b %d, %Y", date);
    if ( day == today ) {
        sub(".*$", day);
        print strftime("%I:%M%p", date), title, URL;
    }
    else if ( day < today ) {
        exit;
    }
}
