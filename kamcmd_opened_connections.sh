upgrades=$(/usr/local/sbin/kamcmd tls.info | sed -n "3p" | awk '{print "kamailio_opened_connections "$2}')

echo '# HELP kamailio_opened_connections kamailio opened tls connections'
echo '# TYPE kamailio_opened_connections gauge'
if [[ -n "${upgrades}" ]] ; then
  echo "${upgrades}"
else
  echo 'kamailio_opened_connections 0'
fi

rtpports=$(/usr/sbin/lsof -P -i UDP:10000-60000 | grep rtpengine | /usr/bin/wc -l)

echo '# HELP rtpengine_open_port_count rtpengine opened port count'
echo '# TYPE rtpengine_open_port_count gauge'
if [[ -n "${rtpports}" ]] ; then
  echo "rtpengine_open_port_count ${rtpports}"
else
  echo 'rtpengine_open_port_count 0'
fi

free_shmem=$(/usr/local/sbin/kamctl stats shmem | grep free_size | awk -F '= ' '{print "free_shmem_memory "$2}')
echo '# HELP free_shmem_memory shmem free memory'
echo '# TYPE free_shmem_memory gauge'
if [[ -n "${free_shmem}" ]] ; then
  echo "${free_shmem}"
else
  echo "free_shmem_memory 0"
fi
