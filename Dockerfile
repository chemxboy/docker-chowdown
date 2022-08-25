FROM tylerobara/alpine-base

COPY chowdown.sh /usr/local/bin/chowdown.sh
COPY gh-pages.zip /tmp/gh-pages.zip
RUN chmod +x /usr/local/bin/chowdown.sh

RUN unzip /tmp/gh-pages.zip \
    && rm /tmp/gh-pages.zip \
    && mv chowdown-gh-pages /opt/app \
    && apk add --update --no-cache ruby ruby-json ruby-bigdecimal ruby-webrick ruby-etc libffi \
    && apk add --virtual build-dependencies build-base ruby-dev libffi-dev \
    && apk -U upgrade \
    && gem install jekyll -N \
    && gem cleanup \
    && apk del build-dependencies

EXPOSE 4000
VOLUME /config

CMD [ "sh", "/usr/local/bin/chowdown.sh" ]
