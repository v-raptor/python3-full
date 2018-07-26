FROM alpine:edge

ADD requirements.txt /code/
WORKDIR /code

RUN apk add --no-cache python3 build-base python3-dev libffi-dev libressl-dev libxml2-dev libxslt-dev \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && pip3 install --no-cache-dir -r requirements.txt \
    && rm -r /root/.cache \
    && apk del build-base python3-dev libffi-dev libressl-dev libxml2-dev libxslt-dev

CMD [ "python3", "app.py" ]
