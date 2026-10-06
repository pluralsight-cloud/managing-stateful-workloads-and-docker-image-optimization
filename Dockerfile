FROM python:3.12-alpine

RUN apk add --no-cache gnupg tar build-base python3-dev

COPY backup_tool.py /usr/local/bin/backup_tool.py
RUN chmod +x /usr/local/bin/backup_tool.py

RUN ln -s /usr/local/bin/backup_tool.py /usr/local/bin/backup-tool

RUN mkdir -p /data /backups

ENV DATA_DIR=/data \
    BACKUP_DIR=/backups \
    CONFIG_FILE=/etc/backup-tool/backup.conf \
    PASSPHRASE_FILE=/etc/backup-tool/secrets/passphrase \
    RETENTION_DAYS=7 \
    BACKUP_PREFIX=backup \
    POLL_SECONDS=5

CMD ["sleep", "infinity"]
