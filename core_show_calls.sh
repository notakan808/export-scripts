upgrades=$(/usr/sbin/asterisk -rx 'core show calls'| head -n 1 | awk '{print "asterisk_call_count{asterisk=\"'$HOSTNAME'\"} "$1}')

echo '# HELP asterisk_call_count asterisk current call count'
echo '# TYPE asterisk_call_count gauge'
if [[ -n "${upgrades}" ]] ; then
  echo "${upgrades}"
else
  echo 'asterisk_call_count{asterisk=\"'$HOSTNAME'\"} 0'
fi
