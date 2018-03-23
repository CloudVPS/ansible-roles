#!/bin/bash
#
# 3-12-2015
# Cees Moerkerken - CloudVPS
#
# Nagios script to check if a redis sentinal is;
# - reachable and has exactly one master. If not exit with CRITICAL
# - and redisstatus is not sentinel_tilt. If not exit with CRITICAL

shopt -s extglob
args=("$@")
HOST=${args[0]}

[ -z $HOST ] && { exit 3; }

unset redisstatus[*]
declare -a redisstatus=( `redis-cli -h $HOST -p 26379 info | grep "sentinel_tilt\|sentinel_masters" `)
unset statsarr[*]
declare -A statsarr
status=0

for r in "${redisstatus[@]}"
do
 stats3=(${r#*:})
 statsarr["${r%:*}"]="${stats3//+([[:space:]])/}"
done

ping=$(redis-cli -h $HOST -p 26379 ping)

[ -z ${statsarr[sentinel_tilt]} ] && { status=3; }

[ ${statsarr[sentinel_tilt]} -ne 0 ] && { status=2; statustxt="sentinel_tilt"; }
[ ${statsarr[sentinel_masters]} -ne 1 ] && { status=2; statustxt="$statustxt / none or many masters"; }
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

