#!/bin/bash
#
# 3-12-2015
# Cees Moerkerken - CloudVPS
#
# Nagios script to check if a redis server is;
# - reachable and is master. If not exit with CRITICAL
# - and has slaves connected. If not exit with WARNING

shopt -s extglob
args=("$@")
HOST=${args[0]}
PORT=${args[1]}
[ -z $PORT ] && { PORT=6378; }

[ -z $HOST ] && { exit 3; }

unset redisstatus[*]
declare -a redisstatus=( `redis-cli -h $HOST -p $PORT info | grep "role\|connected_slaves" `)
unset statsarr[*]
declare -A statsarr
status=0

for r in "${redisstatus[@]}"
do
 stats3=(${r#*:})
 statsarr["${r%:*}"]="${stats3//+([[:space:]])/}"
done

ping=$(redis-cli -h $HOST -p $PORT ping)

[ -z ${statsarr[role]} ] && { status=3; }

[ ${statsarr[connected_slaves]} -eq 0 ] && { status=1; statustxt="$statustxt / no slave connected"; }
[ ${statsarr[role]} != "master" ] && { status=2; statustxt="$statustxt / not master"; }
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

