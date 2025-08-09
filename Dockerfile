FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN sed -i 's|deb.debian.org/debian|archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt update || true

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
