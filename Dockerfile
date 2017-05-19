FROM fradelg/entwine
LABEL version="1.0.0" maintainer="frandelhoyo@gmail.com" author="Connor Manning <connor@hobu.co>"

# Install greyhound using Node v7
RUN apt-get update && apt-get install -y curl gnupg g++ git python make libjsoncpp-dev libcurl4-gnutls-dev && \
    curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get install -y nodejs && \
    git clone https://github.com/hobu/greyhound.git /tmp/greyhound && \
    cd /tmp/greyhound && \
    npm install -g . && \
    apt-get purge -y curl gnupg g++ git python make libjsoncpp-dev libcurl4-gnutls-dev && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/*

EXPOSE 8080
EXPOSE 443
VOLUME /opt/data
VOLUME /greyhound

ENTRYPOINT ["greyhound"]
