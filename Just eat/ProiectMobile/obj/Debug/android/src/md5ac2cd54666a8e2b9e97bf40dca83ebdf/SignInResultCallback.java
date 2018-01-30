package md5ac2cd54666a8e2b9e97bf40dca83ebdf;


public class SignInResultCallback
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.google.android.gms.common.api.ResultCallback
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onResult:(Lcom/google/android/gms/common/api/Result;)V:GetOnResult_Lcom_google_android_gms_common_api_Result_Handler:Android.Gms.Common.Apis.IResultCallbackInvoker, Xamarin.GooglePlayServices.Basement\n" +
			"";
		mono.android.Runtime.register ("ProiectMobile.Adapters.SignInResultCallback, ProiectMobile, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", SignInResultCallback.class, __md_methods);
	}


	public SignInResultCallback ()
	{
		super ();
		if (getClass () == SignInResultCallback.class)
			mono.android.TypeManager.Activate ("ProiectMobile.Adapters.SignInResultCallback, ProiectMobile, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", "", this, new java.lang.Object[] {  });
	}


	public void onResult (com.google.android.gms.common.api.Result p0)
	{
		n_onResult (p0);
	}

	private native void n_onResult (com.google.android.gms.common.api.Result p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
