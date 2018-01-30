/// <summary>
/// File: AuthClass.cs
/// Author: Iancu Mihai-Ovidiu
/// Email: iancu.mihai1994@gamil.com
/// Copyright (c) [2018] [Iancu Mihai-Ovidiu]
/// </summary>

namespace ProiectMobile.Authentification
{
    using Android.App;
    using Android.Gms.Auth.Api;
    using Android.Gms.Auth.Api.SignIn;
    using Android.Gms.Common.Apis;
    using Android.Support.V7.App;
    public class AuthClass
    {
        private GoogleApiClient mGoogleApiClient { get; set; }

        private GoogleSignInOptions gso { get; set; }
        public AppCompatActivity activity { get; set; }

        public GoogleSignInOptions GetGoogleSignInOptions()
        {
            gso = new GoogleSignInOptions.Builder(GoogleSignInOptions.DefaultSignIn)
                    .RequestEmail()
                    .Build();
            return gso;
        }

        public GoogleApiClient GetGoogleApiClient(AppCompatActivity activity, GoogleApiClient.IOnConnectionFailedListener listener)
        {
            this.activity = activity;
            mGoogleApiClient = new GoogleApiClient.Builder(Application.Context)
                .EnableAutoManage(this.activity, listener)
                .AddApi(Auth.GOOGLE_SIGN_IN_API, GetGoogleSignInOptions())
                .Build();
                  
            return mGoogleApiClient;
        }
    }
}
    
