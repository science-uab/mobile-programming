# Search nearby restaurants app
This app uses the `Javascript Geolocation API` and the `Google Places API` to search nearby restaurant.

App URL: https://andreibaic.github.io/NearbyRestaurantsApp/
## How it functions
1. It takes the current position (`latitude` and `longitude` coordinates) and then sends it to the Google Places API along with some options (`radius` and `type of search`)
2. After the response from `Google Places API` we initialize a `Google Map Object` and loop through all the coordinates drawing `Google Map Marker` on the `Google Map Object` for each of them.

Author: 
Baic Andrei `<baic.andrei@gmail.com>`

MIT License 