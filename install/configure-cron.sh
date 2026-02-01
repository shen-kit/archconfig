#!/bin/sh

cd ..

log "Installing user crontab from cron file"
if [ -f "./cron" ]; then
    crontab ./cron
    log "Crontab installed successfully"
else
    warn "No cron file found, skipping crontab setup"
fi

cd install
