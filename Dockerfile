FROM selenium/standalone-chrome:124.0-20240505

WORKDIR /app

COPY requirements.txt .

USER root

RUN apt update && apt install -y python3-pip python3.10-venv openbox obconf

USER seluser

RUN python3 -m venv .venv && . ./.venv/bin/activate && \
    pip3 install --upgrade pip && pip3 install -r requirements.txt

COPY app .

# EXPOSE 8000

CMD [ "./.venv/bin/python3", "main.py" ]
