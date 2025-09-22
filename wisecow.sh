#!/usr/bin/env bash

SRVPORT=4499

# Add /usr/games to PATH so cowsay and fortune are found
export PATH=$PATH:/usr/games

# Check prerequisites
command -v cowsay >/dev/null 2>&1 || { echo "Install cowsay"; exit 1; }
command -v fortune >/dev/null 2>&1 || { echo "Install fortune"; exit 1; }
command -v nc >/dev/null 2>&1 || { echo "Install netcat"; exit 1; }

echo "Wisdom served on port=$SRVPORT..."

while true; do
    { 
        echo -e "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n<pre>$(fortune | cowsay)</pre>"; 
    } | nc -l -p $SRVPORT -q 1
done
l
