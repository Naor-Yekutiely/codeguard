FROM python:3.9 
# # Or any preferred Python version.

WORKDIR /backend

COPY ./src/backEnd /backend

EXPOSE 5000

RUN python -m pip install --upgrade pip 
RUN python -m pip install flask requests
RUN python -m pip install pymongo

CMD python server.py

