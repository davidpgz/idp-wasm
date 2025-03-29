export PATH="$HOME/go/bin:$PATH"
# Generate a bunch of load
bombardier -c 40 -t 5s -d 3m http://localhost:8081
