---
layout: page
title: High School Code
subtitle: Teaching Enrichment Coding
date: 2024-09-20T00:00:00.000Z
author: Janyl Jumadinova
---

## Temperature Sensor Code

```
#include <OneWire.h>
#include <DallasTemperature.h>

// Data wire is connected to digital pin 2
#define ONE_WIRE_BUS 2

// Setup a oneWire instance to communicate with any OneWire devices
OneWire oneWire(ONE_WIRE_BUS);

// Pass our oneWire reference to Dallas Temperature sensor
DallasTemperature sensors(&oneWire);

void setup() {
  // Start serial communication for debugging
  Serial.begin(9600);
  // Start the DS18B20 sensor
  sensors.begin();
}

void loop() {
  // Request temperature readings from the sensor
  sensors.requestTemperatures();
  // Fetch and print the temperature in Celsius
  float temperatureC = sensors.getTempCByIndex(0);
  Serial.print("Temperature (°C): ");
  Serial.println(temperatureC);
  // Wait for 1 second before the next reading
  delay(1000);
}
```

## Arduino Cloud Code

```
#include <ArduinoIoTCloud.h>
#include <Arduino_ConnectionHandler.h>
#include <OneWire.h>
#include <DallasTemperature.h>

// Wi-Fi credentials
const char SSID[]     = "your_wifi_ssid";    // Replace with your Wi-Fi SSID
const char PASS[]     = "your_wifi_password"; // Replace with your Wi-Fi password

// DS18B20 sensor setup
const int ONE_WIRE_BUS = 2; // Data wire connected to pin 2
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);

// Cloud variable
float temperature;

void setup() {
  // Initialize serial communication
  Serial.begin(9600);

  // Setup cloud properties
  ArduinoCloud.begin(ArduinoIoTPreferredConnection);
  ArduinoCloud.addProperty(temperature, READ, ON_CHANGE, NULL);

  // Connect to IoT Cloud
  ArduinoIoTPreferredConnection.begin();

  // Start the DS18B20 temperature sensor
  sensors.begin();

  // Print a message
  Serial.println("Setup complete. Connecting to Arduino IoT Cloud...");
}

void loop() {
  // Update the IoT Cloud
  ArduinoCloud.update();

  // Read temperature from the DS18B20 sensor
  sensors.requestTemperatures();
  temperature = sensors.getTempCByIndex(0);

  // Print temperature to Serial Monitor
  Serial.print("Temperature: ");
  Serial.println(temperature);

  // Delay for a second before the next reading
  delay(1000);
}
```
  

