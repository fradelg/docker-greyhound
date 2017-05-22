FROM fradelg/entwine
LABEL version="1.0.0" maintainer="frandelhoyo@gmail.com" author="Connor Manning <connor@hobu.co>"

# Install greyhound using Node v7
RUN apt-get update && \
    apt-get install -y curl gnupg g++ git python make libjsoncpp-dev libcurl4-gnutls-dev && \
    # Install node v7 \
    curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get install -y nodejs && \
    # Install greyhound \
    git clone --depth 1 -b 1.0.0 https://github.com/hobu/greyhound /tmp/greyhound && \
    cd /tmp/greyhound && \
    npm install -g . && \
    # Cleanup \
    apt-get purge -y curl gnupg g++ git python make libjsoncpp-dev libcurl4-gnutls-dev && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/*

EXPOSE 8080
EXPOSE 443
VOLUME /opt/data
VOLUME /greyhound

ENTRYPOINT ["greyhound"]
