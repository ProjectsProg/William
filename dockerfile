FROM python:3.11-slim

RUN apt-get update && apt-get install -y wget gnupg unzip curl \
  && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update && apt-get install -y google-chrome-stable \
  && apt-get clean

WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt

CMD ["bash", "start.sh"]
