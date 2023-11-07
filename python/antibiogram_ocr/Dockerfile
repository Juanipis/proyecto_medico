FROM python:3.9

ENV PYTHONPATH $PYTHONPATH:/antibiogram_ocr

RUN apt-get update && apt-get install --no-install-recommends -y \
    tesseract-ocr tesseract-ocr-spa && \
    apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
WORKDIR /deps
COPY ./deps/requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /deps

EXPOSE 50051