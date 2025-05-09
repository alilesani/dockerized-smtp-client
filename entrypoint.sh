#!/bin/sh
cat <<EOF > /etc/msmtprc
defaults
auth           on
tls            on

account        default
host           $SMTP_HOST
port           $SMTP_PORT
from           $SMTP_FROM
user           $SMTP_USER
password       $SMTP_PASSWORD
EOF

echo "Subject: $EMAIL_SUBJECT" > /tmp/email.txt
echo "To: $EMAIL_TO" >> /tmp/email.txt
echo "" >> /tmp/email.txt
echo "$EMAIL_BODY" >> /tmp/email.txt

for recipient in $(echo "$EMAIL_TO" | tr ',' ' '); do
    msmtp --account=default --from="$SMTP_FROM" "$recipient" < /tmp/email.txt
done