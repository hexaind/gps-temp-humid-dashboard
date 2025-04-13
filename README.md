
# GPS-Temperature-Humidity Dashboard

A real-time IoT dashboard that logs GPS coordinates, temperature, and humidity data from an ESP32 + SIM7670X module to a MySQL database and sends email alerts when thresholds are exceeded.

## 🌡 Features

- Receives GPS + temperature + humidity data via GET request
- Reverse geocodes coordinates to identify city, state, and country
- Stores data in a MySQL database
- Sends alert emails via AWS SES when temperature exceeds 50°C
- Uses PHPMailer for email integration
- Designed for ESP32-SIM7670X and web dashboard integration

## 🛠 Tech Stack

- PHP (Backend + Email logic)
- MySQL (Database)
- PHPMailer (SMTP Email)
- OpenStreetMap Nominatim API (Geolocation)
- AWS SES (Email alerts)

## 🧪 Sample GET Request

```
https://your-domain.com/log_data.php?temp=52.3&humid=68&latitude=12.9716&longitude=77.5946&altitude=900&speed=2.5&heading=120
```

## 📬 Email Alert Example

- Subject: 🔥 High Temperature Alert!
- Body includes temperature, timestamp, location info, and coordinates

## 📂 Table Schema: `sensor_data`

- temperature (float)
- humidity (float)
- city (varchar)
- region (varchar)
- country (varchar)
- latitude (double)
- longitude (double)
- altitude (double)
- speed (double)
- heading (double)
- timestamp (auto-filled)

## 📦 Deployment

Ensure you have `composer` installed and PHPMailer set up:

```bash
composer require phpmailer/phpmailer
```

## 🔐 SMTP Setup

Edit credentials in `log_data.php` with your SMTP details (e.g., AWS SES).

---

Made with ❤️ by HexaInd
