# OVERWATCH

**Aim**
		Overwatch is a safety solution project for kids. It is a device which monitors the health of the kid (his/her body Temperature and heart-rate) as well as monitor his live location and share that with their parents as and when required. 


# How Will It Work
## Hardware

The device will consist of  components listed below :

 1. Micro-controller
 2. GSM Module
 3. OLED Screen
 4. Temperate Sensor
 5. Heart-rate Sensor
 6. Buzzer
 7. Microphone

Heart-rate sensor and Temperate sensor will continuously monitor child  health conditions. OLED screen will act as screen of the device which will display these reading. GSM module will contain a sim card and  mobile data can be used to share health and location data with the firebase database. Buzzer and microphone are included for safety purpose. It can be used to contact or find the child if he gets lost in crowd or somewhere. Micro-controller will be coded accordingly to achieve these results.


## Software
I have designed a flutter android application. Flutter plugin for Firebase Authentication is used for creation of new user and login of existing email and password. When a new user is registered a new database is created with Firestore automatically with user UID which will store and regularly update the information received  from GSM Module. The dashboard Contains fields to present the values of Heart-rate and Temperature which gets fetched when the bottom button is pressed. On clicking the map card Map Screen is opened. Map Screen is created using Google Maps flutter package and Maps SDK for Android API from google Cloud. The location of the device is marked on Map using marker and Latitude Longitude values fetched from the database.  
