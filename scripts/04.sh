cp /etc/crontab /etc/crontab.log
crontab -l > crontabsum
echo "md1=\"\$(cat /etc/crontab.log)\" && md2=\"\$(md5sum /etc/crontab | awk {'print $1'})\" && \
	if [ '\$md1 != \$md2' ]; then cp /etc/crontab /etc/crontab.log && mail -s \"crontab_modification\" root <<< \"the file was changed\";
	fi" > exe.sh
echo "0 0 * * * sh exe.sh" > crontabsum
crontab crontabsum
rm crontabsum
