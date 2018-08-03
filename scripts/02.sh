echo "apt-get -y update && apt-get -y upgrade" > exe.sh
echo "0 4 * * 1 sh exe.sh > var/log/update_scripts.log" > cron_s
crontab cron_s
