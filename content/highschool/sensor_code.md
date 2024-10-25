## Connecting temperature sensor to Arduino

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

