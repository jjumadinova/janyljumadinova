## Connecting to Arduino Cloud

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
