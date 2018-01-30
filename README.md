# ionic-locating-app

As the description says, with this app you can access your device's current location, display it on Google Maps and get the numeric coordinates.

Ionic is a free and open source mobile SDK for developing native and progressive web apps with ease. For accessing your location I've used the cordova geolocation plugin that provides information about the device's location, such as latitude and longitude.

Starting with Chrome v50, the Geolocation API was removed from unsecured origins. <a href="https://developers.google.com/web/updates/2016/04/geolocation-on-secure-contexts-only">Source</a>

That means your website needs SSL Certification in order to access location based informations.

This repository includes ngrok executable, which is a convenient command line tool that creates a tunnel for localhost to establish both http and https connections.

Put www content inside a fresh ionic framework instance and run the following comands from your current app path:

Commands to run from local folder:
<pre>ionic serve</pre>
<pre>.\ngrok http 8100</pre>

 @Sergiu Turus
