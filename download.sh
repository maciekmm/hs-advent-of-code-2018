#!/bin/sh
secret="`dirname "$0"`/SECRET.sh"
source $secret

day=$(pwd | awk -F'/' '{print $NF}' | awk -F'-' '{print $1}' | sed 's/^0*//')

curl "https://adventofcode.com/2018/day/$day/input" -o input -H 'Accept-Language: en,en-US;q=0.7,pl;q=0.3' --compressed -H "Cookie: session=$session" -H 'Upgrade-Insecure-Requests: 1' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache'

