FROM alpine

ADD requirements.txt /code/
WORKDIR /code

RUN apk add --no-cache python3 \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && pip3 install --no-cache-dir -r requirements.txt \
    && rm -r /root/.cache

CMD [ "python3", "app.py" ]
