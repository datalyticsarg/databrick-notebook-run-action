FROM python:slim

COPY requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

COPY entrypoint.sh /entrypoint.sh
COPY executenotebook.py /executenotebook.py
COPY evaluatenotebookruns.py /evaluatenotebookruns.py

ENTRYPOINT ["/entrypoint.sh"]