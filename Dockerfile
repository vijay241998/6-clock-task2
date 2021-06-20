FROM python:3.6.9-alpine

ADD . /app

RUN pip install --no-cache-dir -i http://mirrors.aliyun.com/pypi/simple/ \
--trusted-host mirrors.aliyun.com -r /app/requirements.txt

ENV GUNICORN_CMD_ARGS="--bind=0.0.0.0:5001 --chdir=./app/ --workers=2"

CMD ["gunicorn", "app:app"]
