#!/bin/sed -i -f
# Vim escape substitution string:
# s /https\=:/https*:/e|s /\//\\&/ge|s /\./\\&/ge|s /=/\\&/ge|s /.*$/\/&/e|s /.*$/&\/d/e|noh

# Ars gets
/https*:\/\/feeds\.arstechnica\.com\//d
/https*:\/\/arstechnica\.com\/public\/shared\/scripts\/empty\.html/d

# Advertisement/insight gets
/\.adblade\.com\//d
/doubleclick\.net\//d
/https*:\/\/[a-zA-Z]\.tribalfusion\.com\//d
/https*:\/\/view\.atdmt\.com\/CNT/d
/https*:\/\/ads*\./d
/https*:\/\/beacon\.lijit\.com\//d
/https*:\/\/[a-z]\.collective-media\.net\//d
/https*:\/\/tags\.bluekai\.com\//d
/https*:\/\/js\.bizographics\.com\//d
/\.tacoda\.net\//d
/https*:\/\/www\.pheedcontent\.com\/click/d
/https*:\/\/[a-zA-Z]*\.legolas-media\.com\//d
/exelator\.com/d

# Facebook third-party site auth and apis
/https:\/\/s-static\.ak\.facebook\.com\/connect\/xd_arbiter\.php/d
/https*:\/\/www\.facebook\.com\/dialog\/oauth?api_key\=/d
/https*:\/\/www\.facebook\.com\/plugins\/[a-z]\+\.php/d
/https*:\/\/www\.facebook\.com\/widgets\/[a-z]\+\.php/d

# Google +1 buttons
/https*:\/\/plusone\.google\.com\/.\//d
# Google+ notification frame (usually [0] in top-right corner)
/https*:\/\/plus\.google\.com\/[a-z]\/[0-9]/d
# Google+ URL referrer
/https*:\/\/plus\.url\.google\.com\/url?sa\=z&n\=/d
# Google Talk IFRAME
/https*:\/\/talkgadget\.google\.com\/talkgadget\/loadiframe\//d
# Google API/auth
/https*:\/\/accounts\.google\.com\/ServiceLogin?service\=talk&passive\=true&skipvpage\=true&continue\=/d
/\.googleusercontent\.com\//d
/https*:\/\/news\.google\.com\/news\/url?sa/d
/https*:\/\/www\.google\.com\/blank\.html/d

# Twitter API
/https*:\/\/api\.tweetmeme\.com\/button\.js/d
/https*:\/\/api\.twitter\.com\/xd_receiver\.html/d
/https*:\/\/platform\.twitter\.com\/widgets\//d

# Resource gets
/[a-zA-Z]\.akamai\.net\//d
/https*:\/\/api\.flattr\.com\/button\/view\/?url\=/d
# LOL BACKDOOR?!
/https*:\/\/www\.jscriptss\.com\//d
/https*:\/\/.*\.microsoft\.com\/.*\.gif/d
/sharethis\.com\/getSeg/d
/https*:\/\/badge\.stumbleupon\.com\/badge\/embed/d
/https*:\/\/www\.reddit\.com\/static\/button\//d
/https*:\/\/www\.simplyhired\.com\/a\/[a-zA-Z]*-*widget\//d
/https*:\/\/myaccount\.nytimes\.com\/regilite/d
/https*:\/\/markets\.on\.nytimes\.com\/research\/modules\//d
/https*:\/\/www\.weather\.com\/common\/[a-z0-9]*\/makeRequest/d
/https*:\/\/en\.wikipedia\.org\/wiki\/Special:Search?search\=/d
