/// <summary>
/// File: LoginActivity.cs
/// Author: Iancu Mihai-Ovidiu
/// Email: iancu.mihai1994@gamil.com
/// Copyright (c) [2018] [Iancu Mihai-Ovidiu]
/// </summary>

namespace ProiectMobile
{
    using Android.App;
    using Android.Content;
    using Android.Views;
    using Android.OS;
    using Android.Gms.Common.Apis;
    using Android.Support.V7.App;
    using Android.Gms.Common;
    using Android.Util;
    using Android.Gms.Auth.Api.SignIn;
    using Android.Gms.Auth.Api;
    using Android.Widget;
    using ProiectMobile.Authentification;
    using Toolbar = Android.Support.V7.Widget.Toolbar;
    using ProiectMobile.Adapters;

    [Activity(MainLauncher = true)]
    public class LoginActivity : AppCompatActivity, View.IOnClickListener, GoogleApiClient.IOnConnectionFailedListener
    {
        const string TAG = "LoginActivity";

        const int RC_SIGN_IN = 9001;

        GoogleApiClient mGoogleApiClient;
        ProgressDialog mProgressDialog;
        AuthClass auth = new AuthClass();

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_main);
            FindViewById(Resource.Id.sign_in_button).SetOnClickListener(this);

            // Set title for action bar
            var toolbar = FindViewById<Toolbar>(Resource.Id.toolbar);
            toolbar.Title = "Login";
            SetSupportActionBar(toolbar);
            
            // Configure sign-in to request the user's ID, email address
            GoogleSignInOptions gso = auth.GetGoogleSignInOptions();

            // Build a GoogleApiClient with access to the Google Sign-In API
            mGoogleApiClient = new GoogleApiClient.Builder(this)
                    .EnableAutoManage(this, this)
                    .AddApi(Auth.GOOGLE_SIGN_IN_API, gso)
                    .Build();

            // Set the dimensions of the sign-in button.
            var signInButton = FindViewById<SignInButton>(Resource.Id.sign_in_button);
            signInButton.SetSize(SignInButton.SizeStandard);

        }

        protected override void OnStart()
        {
            base.OnStart();
            var opr = Auth.GoogleSignInApi.SilentSignIn(mGoogleApiClient);
            if (opr.IsDone)
            {
                // If the user's cached credentials are valid, the OptionalPendingResult will be "done"
                Log.Debug(TAG, "Got cached sign-in");
                var result = opr.Get() as GoogleSignInResult;
                HandleSignInResult(result);
            }
            else
            {
                // If the user has not previously signed in on this device or the sign-in has expired,
                // this asynchronous branch will attempt to sign in the user silently.
                ShowProgressDialog();
                opr.SetResultCallback(new SignInResultCallback { Activity = this });
            }
            mGoogleApiClient.Connect();
        }

        protected override void OnResume()
        {
            base.OnResume();
            HideProgressDialog();
        }

        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            base.OnActivityResult(requestCode, resultCode, data);
            Log.Debug(TAG, "onActivityResult:" + requestCode + ":" + resultCode + ":" + data);

            // Result returned from launching the Intent from GoogleSignInApi.getSignInIntent(...);
            if (requestCode == RC_SIGN_IN)
            {
                var result = Auth.GoogleSignInApi.GetSignInResultFromIntent(data);
                HandleSignInResult(result);
            }
        }

        public void HandleSignInResult(GoogleSignInResult result)
        {
            Log.Debug(TAG, "handleSignInResult:" + result.IsSuccess);
            if (result.IsSuccess)
            {
                Intent intent = new Intent(this, typeof(MenuActivity));
                StartActivity(intent);
                Toast.MakeText(this, "Login successfully", ToastLength.Short).Show();
            }
        }

        void SignIn()
        {
            var signInIntent = Auth.GoogleSignInApi.GetSignInIntent(mGoogleApiClient);
            StartActivityForResult(signInIntent, RC_SIGN_IN);
        }

        public void OnConnectionFailed(ConnectionResult result)
        {
            // An unresolvable error has occurred and Google APIs will not
            // be available.
            Log.Debug(TAG, "onConnectionFailed:" + result);
        }

        protected override void OnStop()
        {
            base.OnStop();
            mGoogleApiClient.Disconnect();
        }

        public void ShowProgressDialog()
        {
            if (mProgressDialog == null)
            {
                mProgressDialog = new ProgressDialog(this);
                mProgressDialog.SetMessage(GetString(Resource.String.loading));
                mProgressDialog.Indeterminate = true;
            }

            mProgressDialog.Show();
        }

        public void HideProgressDialog()
        {
            if (mProgressDialog != null && mProgressDialog.IsShowing)
            {
                mProgressDialog.Hide();
            }
        }

        public void OnClick(View v)
        {
            switch (v.Id)
            {
                case Resource.Id.sign_in_button:
                    SignIn();
                    break;
            }
        }
    }
}





