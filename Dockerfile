# FROM python:3.8-alpine

# ARG USERNAME=app
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

# RUN addgroup -g $USER_GID $USERNAME \
#     && adduser -D -u $USER_UID -G $USERNAME $USERNAME \
#     && mkdir -p /home/$USERNAME \
#     && chown -R $USERNAME:$USERNAME /home/$USERNAME

# USER $USERNAME

# WORKDIR /$USERNAME

# COPY --chown=$USERNAME:$USERNAME /app/requirements.txt .

# RUN pip --disable-pip-version-check install --upgrade pip && pip --disable-pip-version-check install --no-cache-dir -r /app/requirements.txt

# ENV PORT 8080

# RUN chown -R $USER_UID:0 /home/app

# # COPY --chown=$USERNAME:$USERNAME app .

# RUN chmod +x /home/app/.local/bin/gunicorn
# CMD /home/app/.local/bin/gunicorn -b :$PORT main:app


FROM registry.access.redhat.com/ubi8/python-38

# Set working directory
WORKDIR /opt/app-root/src

# Copy requirements and install dependencies
COPY app/requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /opt/app-root/src/requirements.txt

# Copy application code
COPY app .

# Set environment variables
ENV PORT=8080

# Expose the port
EXPOSE ${PORT}

# Run the application using gunicorn
CMD gunicorn -b :$PORT main:app
