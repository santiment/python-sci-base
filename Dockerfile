FROM python:3.6-alpine as builder

WORKDIR /app

RUN apk add --no-cache gcc g++ make gfortran \
  libffi libffi-dev openssl openssl-dev libxml2-dev libxml2 \
  libxslt libxslt-dev lapack-dev

RUN pip wheel cython numpy -w /wheels
RUN pip install cython numpy --find-links /wheels

COPY requirements.txt /app/requirements.txt
RUN pip wheel -v -r requirements.txt -w /wheels

RUN pip install -r requirements.txt --find-links /wheels

FROM python:3.6-alpine

WORKDIR /app

RUN apk add --no-cache libstdc++ libffi lapack

COPY --from=builder /wheels /wheels
COPY requirements.txt /app/requirements.txt
RUN pip install cython numpy --find-links /wheels
RUN pip install -r requirements.txt --find-links /wheels
