from os import environ 
from smtplib import SMTP, SMTP_SSL
from email.mime.multipart import MIMEMultipart

from_email  = environ['USERNAME']
password    = environ['PASSWORD']
to_email    = environ['TO_EMAIL']
message     = environ['EMAIL']

if from_email.split("@",2)[1] == "gmail.com":
    s = SMTP("smtp.gmail.com", 587)
    s.starttls()
elif from_email.split("@",2)[1] == "fssai.gov.in":
    s = SMTP_SSL("mail.gov.in", 465)
    msg = MIMEMultipart()
    msg['Subject'] = "Test Mail"
    msg['From']    = from_email
    msg['To']      = to_email
    msg.set_payload(message)
    message = msg.as_string()

s.login(from_email, password)
s.sendmail(from_email, to_email, message)
s.quit()