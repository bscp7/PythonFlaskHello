FROM python:3.8-alpine

ARG USERNAME=app
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN addgroup -g $USER_GID $USERNAME \
    && adduser -D -u $USER_UID -G $USERNAME $USERNAME \
    && mkdir -p /home/$USERNAME

USER $USERNAME

WORKDIR /home/$USERNAME

COPY --chown /app/requirements.txt .

RUN pip --disable-pip-version-check install --upgrade pip && pip --disable-pip-version-check install --no-cache-dir -r /app/requirements.txt

ENV PORT 8080

RUN chmod +x /home/app/.local/bin/gunicorn

RUN chown -R $USER_UID:0 /home/app

COPY --chown=$USERNAME:$USERNAME app .

CMD /home/app/.local/bin/gunicorn -b :$PORT main:app

