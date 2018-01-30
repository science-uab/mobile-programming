/// <summary>
/// File: MenuActivity.cs
/// Author: Iancu Mihai-Ovidiu
/// Email: iancu.mihai1994@gamil.com
/// Copyright (c) [2018] [Iancu Mihai-Ovidiu]
/// </summary>

namespace ProiectMobile
{
    using Android.App;
    using Android.Content;
    using Android.Gms.Auth.Api;
    using Android.Support.V7.App;
    using Android.Gms.Common;
    using Android.Gms.Common.Apis;
    using Android.OS;
    using Android.Views;
    using Android.Widget;
    using ProiectMobile.Authentification;
    using ProiectMobile.Adapters;
    using Toolbar = Android.Support.V7.Widget.Toolbar;
    [Activity(Label = "MenuActivity")]
    public class MenuActivity : AppCompatActivity, View.IOnClickListener, GoogleApiClient.IOnConnectionFailedListener
    {
        AuthClass auth = new AuthClass();
        private GoogleApiClient mGoogleApiClient;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity2);

            // Set on click event listener for buttons
            mGoogleApiClient = auth.GetGoogleApiClient(this,this);
            FindViewById(Resource.Id.buttonRestaurantList).SetOnClickListener(this);
            FindViewById(Resource.Id.buttonRestaurantMap).SetOnClickListener(this);

            // Set title for action bar
            var toolbar = FindViewById<Toolbar>(Resource.Id.toolbar);
            toolbar.Title = "MenuActivity";
            SetSupportActionBar(toolbar);
        }

        public void OnClick(View v)
        {
            switch (v.Id)
            {
                case Resource.Id.buttonRestaurantList:
                    GetRestaurantListActivity();
                    break;
                case Resource.Id.buttonRestaurantMap:
                    GetRestaurantLocationActivity();
                    break;
            }
        }

        public void OnConnectionFailed(ConnectionResult result)
        {
            throw new System.NotImplementedException();
        }

        protected override void OnStart()
        {
            base.OnStart();
        }

        protected override void OnStop()
        {
            mGoogleApiClient.Disconnect();
            base.OnStop();
        }

        public void SignOut()
        {
            // SignOut form Google Api
            Auth.GoogleSignInApi.SignOut(mGoogleApiClient).SetResultCallback(new SignOutResultCallback { Activity = this }); ;
        }

        public void GetRestaurantListActivity()
        {
            // Intent new Activity
            Intent intent = new Intent(this, typeof(RestaurantListActivity));
            StartActivity(intent);
        }

        public void GetRestaurantLocationActivity()
        {
            // Intent new Activity
            Intent intent = new Intent(this, typeof(RestaurantLocationActivity));
            StartActivity(intent);
        }

        public void ReturnToLogin()
        {
            // Intent new Activity
            Intent intent = new Intent(this, typeof(LoginActivity));
            StartActivity(intent);
            Toast.MakeText(this, "Logout successfully", ToastLength.Short).Show();
            Finish();
        }

        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            MenuInflater.Inflate(Resource.Menu.menu, menu);
            return base.OnCreateOptionsMenu(menu);
        }
        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            if (item.ItemId == Resource.Id.menu)
            {
                SignOut();
            }
               
            return base.OnOptionsItemSelected(item);
        }
    }
}