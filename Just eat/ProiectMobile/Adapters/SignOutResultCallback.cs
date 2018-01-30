/// <summary>
/// File: SignOutResultCallback.cs
/// Author: Iancu Mihai-Ovidiu
/// Email: iancu.mihai1994@gamil.com
/// Copyright (c) [2018] [Iancu Mihai-Ovidiu]
/// </summary>

namespace ProiectMobile.Adapters
{
    using Android.Gms.Common.Apis;
    using Java.Lang;
    public class SignOutResultCallback : Object, IResultCallback
    {
        public MenuActivity Activity { get; set; }

        public void OnResult(Object result)
        {
            Activity.ReturnToLogin();
        }
    }
}
