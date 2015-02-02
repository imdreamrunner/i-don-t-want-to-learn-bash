# Search Google and print links
# arguments: <key+words>
wget -U firefox -O - "https://www.google.com/search?q=$1" 2>/dev/null | \
  grep -o '<a href="/url?q=[^"'"'"']*&amp;sa' | \
  sed -e 's/^<a href=["'"'"']\/url?q=//' -e 's/&amp;sa$//'