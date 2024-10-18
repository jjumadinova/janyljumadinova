---
layout: page
title: Middle School
subtitle: Teaching Enrichment
date: 2024-09-09T00:00:00.000Z
author: Janyl Jumadinova
---

# Robotics Enrichment Program

## Middle School Robotics Majors Schedule

### Basic Electronics and Introduction to Robotics &#8594; Programming Boards and Sensors &#8594; ROV Design and Frame Building &#8594; Motor Control

## Session 1

- [Getting Started with Arduino](https://docs.google.com/presentation/d/1glz2kz48QZUh9vxGn77U0fta346_-CcPX2OKMbvTHKU/pub?start=false&loop=false&delayms=3000)
- [Introduction to Robotics](https://docs.google.com/presentation/d/1lBvxaRCd3KU_Ci5lfe21iA764TSjV_uB2NCJ-5d7bz0/pub?start=false&loop=false&delayms=3000)

## Session 2

[Coding with Arduino](https://docs.google.com/presentation/d/1glz2kz48QZUh9vxGn77U0fta346_-CcPX2OKMbvTHKU/pub?start=false&loop=false&delayms=3000)


## Session 3

- [ROV Design](https://docs.google.com/presentation/d/e/2PACX-1vQWSJ-LTjKax765M4Tb8IaaCMy6xUJXwrjwBrQnm7xYQpuh90R1BHoic0XvRE8fM0jtP_GcmbqahbTz/pub?start=false&loop=false&delayms=3000)
- [Building the ROV Frame](https://docs.google.com/document/d/1JO1pM3XBeRCmAP9afXCYYmD5eIm-PML3H3EooP9FBmE/edit?usp=sharing)
- Sensors
  
```
int soilMoistureValue = 0;

void setup(){
  Serial.begin(9600); // Start up Serial Port
  Serial.println("Simple Data Reading Program - send data over serial");
}

void loop(){
  soilMoistureValue = analogRead(A0);  //put Sensor insert into soil
  Serial.print("Moisture reading: ");
  Serial.println(soilMoistureValue);
 	delay(5000); // in ms
}
```
