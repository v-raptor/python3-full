FROM alpine:3.6

ADD requirements.txt /code/
WORKDIR /code

RUN apk add --no-cache python3 build-base python3-dev libffi-dev libressl-dev libressl-dev libxml2-dev libxslt \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && pip3 install --no-cache-dir -r requirements.txt \
    && rm -r /root/.cache \
    && apk del build-base python3-dev libffi-dev libressl-dev libxml2-dev libxslt

CMD [ "python3", "app.py" ]
