#!/bin/bash
#
# 3-12-2015
# Cees Moerkerken - CloudVPS
#
# Nagios script to check if a redis server is;
# - reachable and is slave. If not exit with CRITICAL
# - and slave sync is full. If not exit with WARNING

shopt -s extglob
args=("$@")
HOST=${args[0]}

[ -z $HOST ] && { exit 3; }

unset redisstatus[*]
declare -a redisstatus=( `redis-cli -h $HOST info | grep "sync_full\|role" `)
unset statsarr[*]
declare -A statsarr
status=0

for r in "${redisstatus[@]}"
do
 stats3=(${r#*:})
 statsarr["${r%:*}"]="${stats3//+([[:space:]])/}"
done

ping=$(redis-cli -h $HOST ping)

[ -z ${statsarr[role]} ] && { status=3; }

[ ${statsarr[sync_full]} -ne 1 ] && { status=1; statustxt="sync not full"; }
[ ${statsarr[role]} != "slave" ] && { status=2; statustxt="$statustxt / not slave"; }
[ $ping != "PONG" ] && { status=2; statustxt="$statustxt / no ping"; }

case $status in
0)
statustxt=OK
echo "$statustxt"
exit 0
;;
1)
statustxt="WARNING - $statustxt"
echo "$statustxt"
exit 1
;;
2)
statustxt="CRITICAL - $statustxt"
echo "$statustxt"
exit 2
;;
3)
statustxt="UNKNOWN - $statustxt"
echo "$statustxt"
exit 3
;;
esac

