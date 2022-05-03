#!/bin/bash
# notify.sh

# echo $1 $2 is in $3 state > /var/run/keepalived.$1.$2.state

dir=/tmp/
keepalived_status_file=keepalived.status

if [ -f ${keepalived_status_file} ]; then
  find ${dir} -type f -name ${keepalived_status_file} ! -perm 0644 -print0 | xargs -0 chmod 644
else
   touch ${dir}/${keepalived_status_file}
   chmod 644 ${dir}/${keepalived_status_file}
fi

echo "$3" > ${dir}/${keepalived_status_file}
