#include <WiFi.h>
#include <HTTPClient.h>
#include <TinyGPSPlus.h>
#include "DHT.h"

// WiFi credentials
const char* ssid = "HEXAIND";
const char* password = "hexaind01";

// Server URL
String serverName = "https://project01.hexacube.in/log_data.php";

// Timer interval (1 minute)
unsigned long previousMillis = 0;
const long interval = 60000;

// DHT Sensor setup
#define DHTPIN 0
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

// GPS setup
TinyGPSPlus gps;
#define GPS_RX 10
#define GPS_TX 9
HardwareSerial GPSSerial(1);

void setup() {
  Serial.begin(115200);
  delay(1000);
  Serial.println("ESP32-C3 Starting...");

  dht.begin();
  Serial.println("✅ DHT11 Initialized");

  GPSSerial.begin(9600, SERIAL_8N1, GPS_RX, GPS_TX);
  Serial.println("📡 GPS Initialized");

  WiFi.begin(ssid, password);
  Serial.print("🔌 Connecting to WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  }
  Serial.println("\n✅ WiFi Connected");
  Serial.print("IP: ");
  Serial.println(WiFi.localIP());

  // Optional: Force DNS to Cloudflare
  WiFi.config(INADDR_NONE, INADDR_NONE, INADDR_NONE, IPAddress(1, 1, 1, 1));
}

void loop() {
  while (GPSSerial.available()) {
    gps.encode(GPSSerial.read());
  }

  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;

    float temp = dht.readTemperature();
    float humid = dht.readHumidity();

    if (isnan(temp) || isnan(humid)) {
      Serial.println("❌ DHT Read Failed");
      return;
    }

    if (!gps.location.isValid() || !gps.altitude.isValid() || !gps.speed.isValid() || !gps.course.isValid()) {
      Serial.println("❌ GPS data not ready (location, altitude, speed, or heading)");
      return;
    }

    float lat = gps.location.lat();
    float lng = gps.location.lng();
    float alt = gps.altitude.meters();       // meters
    float spd = gps.speed.kmph();            // km/h
    float head = gps.course.deg();           // degrees

    Serial.printf("🌡 Temp: %.1f°C | 💧 Humidity: %.1f%%\n", temp, humid);
    Serial.printf("📍 Lat: %.6f | Lng: %.6f\n", lat, lng);
    Serial.printf("📏 Altitude: %.2f m | 🚗 Speed: %.2f km/h | 🧭 Heading: %.2f°\n", alt, spd, head);
    Serial.printf("📶 RSSI: %d dBm\n", WiFi.RSSI());

    if (WiFi.status() == WL_CONNECTED) {
      String url = serverName +
                   "?temp=" + String(temp, 1) +
                   "&humid=" + String(humid, 1) +
                   "&latitude=" + String(lat, 6) +
                   "&longitude=" + String(lng, 6) +
                   "&altitude=" + String(alt, 2) +
                   "&speed=" + String(spd, 2) +
                   "&heading=" + String(head, 2);

      HTTPClient http;
      int httpResponseCode = -1;

      for (int attempt = 1; attempt <= 3; attempt++) {
        Serial.printf("🌐 Attempt %d: Sending to %s\n", attempt, url.c_str());

        http.begin(url);
        http.addHeader("User-Agent", "Mozilla/5.0");

        httpResponseCode = http.GET();

        if (httpResponseCode > 0) {
          Serial.printf("✅ HTTP Response [%d]: %s\n", httpResponseCode, http.getString().c_str());
          break;  // success
        } else {
          Serial.printf("❌ HTTP Error: %s\n", http.errorToString(httpResponseCode).c_str());
          http.end();
          delay(1000);
        }
      }

      http.end();

      if (httpResponseCode <= 0) {
        Serial.println("🚫 Failed to send data after retries.");
      }

    } else {
      Serial.println("❌ WiFi Disconnected");
    }
  }
}
