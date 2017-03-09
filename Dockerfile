FROM python:3.6.0-alpine

EXPOSE 8000

COPY . /opt/httpbin
WORKDIR /opt/httpbin

RUN apk add --no-cache gcc musl-dev

RUN pip install -r requirements.txt

CMD ["gunicorn", "-b", "0.0.0.0:8000", "-w", "8", "httpbin:app"]
