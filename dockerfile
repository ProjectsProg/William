FROM python:3.11-slim

# Instala Chrome e dependências básicas
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    unzip \
    fonts-liberation \
    libnss3 \
    libxss1 \
    libgconf-2-4 \
    libappindicator1 \
    libasound2 \
    libgbm1 \
    xdg-utils \
    ca-certificates \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Instala o Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y ./google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb

# Define diretório de trabalho
WORKDIR /app
COPY . .

# Instala as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Comando de inicialização
CMD ["python", "app.py"]
