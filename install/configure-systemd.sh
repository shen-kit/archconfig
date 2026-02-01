#!/bin/sh

cd ..

log "Adding niri.service dms"
systemctl --user add-wants niri.service dms

log "Enabling sddm"
sudo systemctl enable sddm.service
sudo systemctl set-default graphical.target
sudo cp -r ./sddm-astronaut-theme /usr/share/sddm/themes/
echo "[Theme]" | sudo tee /etc/sddm.conf
echo "  Current=sddm-astronaut-theme" | sudo tee -a /etc/sddm.conf

log "Enabling power-profiles-daemon"
sudo systemctl enable --now power-profiles-daemon.service

log "Configuring keyd for escape tap-hold behaviour"
sudo systemctl enable --now keyd
sudo cp -f ./keyd.conf /etc/keyd/default.conf
sudo keyd reload

cd install
