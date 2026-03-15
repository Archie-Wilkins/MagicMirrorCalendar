# MagicMirror²

A customised [MagicMirror²](https://magicmirror.builders) setup with a full-screen week grid calendar on the right and a daily agenda on the left.

## Setup

### Raspberry Pi (fresh install)

Clone the repo and run the setup script — it handles Node.js, dependencies, and modules automatically:

```bash
git clone <your-repo-url>
cd MagicMirror
bash setup.sh
```

Then edit `config/config.js`, set your Google Calendar ICS URL in the two `url:` fields, and start:

```bash
npm start
```

### Manual setup

#### 1. Install Node.js (if not already installed)

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs
```

#### 2. Install dependencies

```bash
npm install
```

#### 3. Install third-party modules

```bash
cd modules/MMM-CalendarExt3 && npm install && cd ../..
cd modules/MMM-CalendarExt3Agenda && npm install && cd ../..
```

#### 4. Configure your calendar URL

Edit `config/config.js` and replace the `url:` values with your Google Calendar ICS URL:

```js
url: "https://calendar.google.com/calendar/ical/<your-calendar-id>/basic.ics"
```

To find your ICS URL: Google Calendar → Settings → your calendar → "Secret address in iCal format".

#### 5. Start

```bash
npm start
```

## Layout

- **Top left** — clock + today/tomorrow agenda (MMM-CalendarExt3Agenda)
- **Top right** — 4-week rolling grid calendar (MMM-CalendarExt3)

## Customisation

All visual overrides are in `css/custom.css`. The underlying module CSS is not modified.
