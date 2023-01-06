FROM python:3.9 
# Or any preferred Python version.

WORKDIR /backend

COPY . .

EXPOSE 5000


RUN python -m pip install --upgrade pip 
RUN pip install flask requests


CMD python server.py
