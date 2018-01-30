/// <summary>
/// File: RestaurantListActivity.cs
/// Author: Iancu Mihai-Ovidiu
/// Email: iancu.mihai1994@gamil.com
/// Copyright (c) [2018] [Iancu Mihai-Ovidiu]
/// </summary>

namespace ProiectMobile
{
    using Android.App;
    using Android.OS;
    using Android.Support.V7.App;
    using Android.Views;
    using Android.Widget;
    using Firebase.Xamarin.Database;
    using ProiectMobile.Adapters;
    using ProiectMobile.Models;
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using Toolbar = Android.Support.V7.Widget.Toolbar;

    [Activity(Label = "RestaurantListActivity")]
    public class RestaurantListActivity : AppCompatActivity
    {
        private ListView list_data;
        private List<RestaurantList> restaurantList = new List<RestaurantList>();
        private RestaurantAdapter adapter;

        private const string FirebaseURL = "https://fir-school-project.firebaseio.com/";
        
        protected async override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity3);

            // Set title for action bar
            var toolbar = FindViewById<Toolbar>(Resource.Id.toolbar);
            toolbar.Title = "Restaurant List";
            SetSupportActionBar(toolbar);
           
            // List view
            list_data = FindViewById<ListView>(Resource.Id.RestaurantListView);

            await LoadData();
        }

        public async Task LoadData()
        {
            // Load data from Firebase platform and store 
            // into list 
            list_data.Visibility = ViewStates.Invisible;
            var firebase = new FirebaseClient(FirebaseURL);

            var items = await firebase.Child("users").OnceAsync<RestaurantList>();
            restaurantList.Clear();
            adapter = null;

            foreach (var item in items)
            {
                RestaurantList restaurant = new RestaurantList();
                restaurant.id = item.Key;
                restaurant.name = item.Object.name;
                restaurant.phone = item.Object.phone;
                restaurant.email = item.Object.email;

                restaurantList.Add(restaurant);
            }
            adapter = new RestaurantAdapter(this, restaurantList);
            adapter.NotifyDataSetChanged();
            list_data.Adapter = adapter;

            list_data.Visibility = ViewStates.Visible;
        }
    }
}





