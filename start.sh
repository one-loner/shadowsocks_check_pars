#!/bin/bash
ll=$(cat tg_links.txt)
for line in $ll; do
   wget -O links.html $line
   cat links.html | grep ss:// | sed 's/<\/br><\/br>/\n/g' | sed 's/<div class="tgme_widget_message_text js-message_text" dir="auto"><code>//g' | sed 's/<br\/><br\/>/\n/g' |  sed 's/<\/br>/\n/g' | sed 's/<br\/>/\n/g' | sed 's/<div class="tgme_widget_message_text js-message_text" dir="auto">//g' | grep ^ss:// | grep -v '<a href=' >> ss_links.txt
done

a=$(cat ss_links.txt)
for line in $a; do

    ./convurl.sh $line check.json 1070

    ss-local -l 1070 -c check.json > /dev/null &
    python3 check.py > res
    checkres=$(cat res)
    echo $checkres
    killall ss-local 2> /dev/null
    if [ "$checkres" = "200" ]; then
       echo $line >> good.txt
    fi
done
rm res
cat good.txt
