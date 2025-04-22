# dockerized-smtp-client
simple smtp client solution

## Build

```bash
docker build -t email-sender . 
```

## Send Mail

```bash
docker run --rm \                                                                  
  -e SMTP_HOST="your_smtp_host" \
  -e SMTP_PORT="587" \
  -e SMTP_USER="your_smtp_user" \
  -e SMTP_PASSWORD="your_smtp_password" \
  -e SMTP_FROM="your_smtp_user" \
  -e EMAIL_TO="smtp_target" \
  -e EMAIL_SUBJECT="your_email_target" \
  -e EMAIL_BODY="your_message" \
  email-sender   

```