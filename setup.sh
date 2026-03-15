#!/bin/bash
set -e

echo "==> Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "==> Installing MagicMirror dependencies..."
npm install

echo "==> Installing third-party modules..."
cd modules
git clone https://github.com/MMRIZE/MMM-CalendarExt3
git clone https://github.com/MMRIZE/MMM-CalendarExt3Agenda
cd MMM-CalendarExt3 && npm install && cd ..
cd MMM-CalendarExt3Agenda && npm install && cd ..
cd ..

echo "==> Done. Edit config/config.js with your GCAL_URL, then run 'npm start'."
