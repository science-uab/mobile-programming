/// <summary>
/// File: RestaurantLocationActivity.cs
/// Author: Iancu Mihai-Ovidiu
/// Email: iancu.mihai1994@gamil.com
/// Copyright (c) [2018] [Iancu Mihai-Ovidiu]
/// </summary>

namespace ProiectMobile
{
    using Android.App;
    using Android.Content;
    using Android.Gms.Maps;
    using Android.Gms.Maps.Model;
    using Android.Locations;
    using Android.OS;
    using Android.Support.V7.App;
    using Firebase.Xamarin.Database;
    using ProiectMobile.Models;
    using System.Collections.Generic;
    using System.Linq;
    using Toolbar = Android.Support.V7.Widget.Toolbar;

    [Activity(Label = "RestaurantLocationActivity")]
    public class RestaurantLocationActivity : AppCompatActivity, IOnMapReadyCallback
    {
        private GoogleMap mMap;
        private List<RestaurantLocation> restaurantList = new List<RestaurantLocation>();
        private const string FirebaseURL = "https://fir-school-project.firebaseio.com/";

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity4);

            // Set title for action bar
            var toolbar = FindViewById<Toolbar>(Resource.Id.toolbar);
            toolbar.Title = "Restaurant Locations";
            SetSupportActionBar(toolbar);

            LoadData();
            SetUpMap();
        }

        private void SetUpMap()
        {
            if (mMap == null)
            {
                FragmentManager.FindFragmentById<MapFragment>(Resource.Id.map).GetMapAsync(this);
            }
        }

        public void OnMapReady(GoogleMap googleMap)
        {
            mMap = googleMap;

            mMap.MyLocationEnabled = true;
            mMap.UiSettings.MyLocationButtonEnabled = true;

            // Getting LocationManager object from System Service LOCATION_SERVICE
            LocationManager locationManager = (LocationManager)GetSystemService(Context.LocationService);

            // Creating a criteria object to retrieve provider
            Criteria criteria= new Criteria
            {
                Accuracy = Accuracy.Fine
            };

            // Getting the name of the best provider
            var provider = locationManager.GetProviders(criteria, true);

            // Getting Current Location
            Location location = locationManager.GetLastKnownLocation(provider.First());

            double latitude = location.Latitude;
            double longitude = location.Longitude;

            // Add GoogleMaps marker for each item in list
            LatLng latLng = new LatLng(latitude, longitude);
            MarkerOptions options = new MarkerOptions()
            .SetPosition(latLng)
            .SetTitle("Your location");
            mMap.AddMarker(options);
            CameraUpdate camera = CameraUpdateFactory.NewLatLngZoom(latLng, 14);
            mMap.MoveCamera(camera);

            foreach (var item in restaurantList)
            {
                LatLng lat = new LatLng(item.latitude, item.longitude);
               
                MarkerOptions options22 = new MarkerOptions()
                .SetPosition(lat)
                .SetTitle(item.title);
                mMap.AddMarker(options22);
            } 
        }

        public void LoadData()
        {
            // Load data from Firebase platform and store 
            // into list 
            var firebase = new FirebaseClient(FirebaseURL);
            var items = firebase.Child("locations")
                .OnceAsync<RestaurantLocation>().Result;
            restaurantList.Clear();

            foreach (var item in items)
            {
                RestaurantLocation restaurant = new RestaurantLocation();
                restaurant.id = item.Key;
                restaurant.latitude = item.Object.latitude;
                restaurant.longitude = item.Object.longitude;
                restaurant.title = item.Object.title;

                restaurantList.Add(restaurant);
            }
        }
    }
}





