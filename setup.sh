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

echo "==> Setting up secrets..."
if [ ! -f config/secrets.js ]; then
  cp config/secrets.js.sample config/secrets.js
  echo ""
  echo "  !! Edit config/secrets.js and set your GCAL_URL before starting !!"
  echo ""
else
  echo "  config/secrets.js already exists, skipping."
fi

echo "==> Done. Run 'npm start' to launch MagicMirror."
