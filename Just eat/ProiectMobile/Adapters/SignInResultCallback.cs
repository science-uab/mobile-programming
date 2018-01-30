/// <summary>
/// File: SignInResultCallback.cs
/// Author: Iancu Mihai-Ovidiu
/// Email: iancu.mihai1994@gamil.com
/// Copyright (c) [2018] [Iancu Mihai-Ovidiu]
/// </summary>

namespace ProiectMobile.Adapters
{
    using Android.Gms.Auth.Api.SignIn;
    using Android.Gms.Common.Apis;
    using Java.Lang;

    public class SignInResultCallback : Object, IResultCallback
	{
		public LoginActivity Activity { get; set; }

		public void OnResult(Object result)
		{
			var googleSignInResult = result as GoogleSignInResult;
			Activity.HideProgressDialog();
			Activity.HandleSignInResult(googleSignInResult);
		}
	}
}
