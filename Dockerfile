FROM python:3.6

ADD . /comic-book-reader

WORKDIR /comic-book-reader

RUN apt-get update && apt-get install -y \
    enchant-2 \
    tesseract-ocr \
    tesseract-ocr-chi_sim \
    libtesseract-dev \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--timeout", "60", "--workers=2", "--threads=4", "--worker-class=gthread", "app"]
