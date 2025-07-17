ARG USERNAME=app
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupmod --gid $USER_GID $USERNAME \
    && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME

USER $USERNAME

FROM python:3.8-alpine

WORKDIR /app

RUN whoami

COPY /app/requirements.txt .

RUN pip --disable-pip-version-check install --upgrade pip

RUN pip --disable-pip-version-check install -r /app/requirements.txt

ENV PORT 9000

COPY app .

CMD gunicorn -b :$PORT main:app
