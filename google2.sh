# Search Google and save result
# arguments: <key+words>
URL=https://www.google.com/search?q=$1
echo Downloading from $URL
result=$(wget -U firefox -O - $URL 2>/dev/null | grep -o '<a href="/url?q=[^"'"'"']*&amp;sa' | sed -e 's/^<a href=["'"'"']\/url?q=//' -e 's/&amp;sa$//')

i=1
for r in $result
do
    echo $i $r
    wget -U firefox -O - "$r" >$i.html 2>/dev/null
    i=$((i+1))
done