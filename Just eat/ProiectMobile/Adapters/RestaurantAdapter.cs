/// <summary>
/// File: RestaurantAdapterActivity.cs
/// Author: Iancu Mihai-Ovidiu
/// Email: iancu.mihai1994@gamil.com
/// Copyright (c) [2018] [Iancu Mihai-Ovidiu]
/// </summary>

namespace ProiectMobile.Adapters
{
    using System.Collections.Generic;
    using Android.App;
    using Android.Content;
    using Android.Views;
    using Android.Widget;
    using ProiectMobile.Models;
    class RestaurantAdapter : BaseAdapter
    {
        Activity activity;
        List<RestaurantList> listRestaurant;
        LayoutInflater inflater;


        public RestaurantAdapter(Activity activity, List<RestaurantList> listRestaurant)
        {
            this.activity = activity;
            this.listRestaurant = listRestaurant;
        }

        public override int Count
        {
            get
            {
                return listRestaurant.Count;
            }
        }

        public override Java.Lang.Object GetItem(int position)
        {
            return position;
        }

        public override long GetItemId(int position)
        {
            return position;
        }

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            inflater = (LayoutInflater)activity.BaseContext.GetSystemService(Context.LayoutInflaterService);
            View itemView = inflater.Inflate(Resource.Layout.restaurantItemList, null);

            TextView txtUser = itemView.FindViewById<TextView>(Resource.Id.list_name);
            TextView txtPhone = itemView.FindViewById<TextView>(Resource.Id.list_phone);
            TextView txtEmail = itemView.FindViewById<TextView>(Resource.Id.list_email);

            if (listRestaurant.Count > 0)
            {
                txtUser.Text = listRestaurant[position].name;
                txtPhone.Text = listRestaurant[position].phone;
                txtEmail.Text = listRestaurant[position].email;
            }
            return itemView;
        }
    }
}