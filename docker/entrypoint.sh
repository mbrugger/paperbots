#!/bin/sh

sed -i -e 's#RELOAD_PASSWORD#'"$RELOAD_PASSWORD"'#g' /etc/paperbots/config.json
sed -i -e 's#EMAIL_HOST#'"$EMAIL_HOST"'#g' /etc/paperbots/config.json
sed -i -e 's#EMAIL_PORT#'"$EMAIL_PORT"'#g' /etc/paperbots/config.json
sed -i -e 's#EMAIL_EMAIL#'"$EMAIL_EMAIL"'#g' /etc/paperbots/config.json
sed -i -e 's#EMAIL_PASSWORD#'"$EMAIL_PASSWORD"'#g' /etc/paperbots/config.json
sed -i -e 's#DB_JDBC_URL#'"$DB_JDBC_URL"'#g' /etc/paperbots/config.json
sed -i -e 's#DB_USER#'"$DB_USER"'#g' /etc/paperbots/config.json
sed -i -e 's#DB_PASSWORD#'"$DB_PASSWORD"'#g' /etc/paperbots/config.json

java -jar /opt/paperbots/app/paperbots.jar -s /opt/paperbots/site/ -c /etc/paperbots/config.json