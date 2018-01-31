package com.example.gabriel.androidspeedmeter;

import android.annotation.SuppressLint;
import android.app.Service;
import android.content.Intent;
import android.location.Location;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;

import java.text.DecimalFormat;
import java.util.concurrent.TimeUnit;

/**
 * Created by Gabriel on 1/30/2018.
 */

public class LocationService extends Service implements GoogleApiClient.ConnectionCallbacks,
        GoogleApiClient.OnConnectionFailedListener,
        LocationListener{

    private static final long INTERVAL = 1000*2;
    private static final long FASTEST_INTERVAL = 1000;
    LocationRequest mLocationRequest;
    GoogleApiClient mGoogleApiClient;
    Location mCurrentLocation, lStart, lEnd;

    static double distance = 0;

    private final IBinder mBinder = new LocalBinder();

    @Nullable
    @Override
    public IBinder onBind(Intent intent){
        createLocationRequest();
        mGoogleApiClient = new GoogleApiClient.Builder(this)
                .addApi(LocationServices.API)
                .addConnectionCallbacks(this)
                .addOnConnectionFailedListener(this)
                .build();
        mGoogleApiClient.connect();
        return mBinder;
    }

    private void createLocationRequest() {
        mLocationRequest = new LocationRequest();
        mLocationRequest.setInterval(INTERVAL);
        mLocationRequest.setFastestInterval(FASTEST_INTERVAL);
        mLocationRequest.setPriority(LocationRequest.PRIORITY_HIGH_ACCURACY);

    }

    @Override
    public void onConnected(@Nullable Bundle bundle) {
        try {
           LocationServices.FusedLocationApi.requestLocationUpdates(mGoogleApiClient,mLocationRequest,this);
        }catch(SecurityException e)
        {

        }
    }

    @Override
    public void onConnectionSuspended(int i) {

    }

    @Override
    public void onConnectionFailed(@NonNull ConnectionResult connectionResult) {

    }

    @Override
    public void onLocationChanged(Location location) {
        MainActivity.progressDialog.dismiss();
        mCurrentLocation=location;
        if(lStart==null)
        {
            lStart = lEnd =mCurrentLocation;
        }
        else
            lEnd =  mCurrentLocation;
        
        //Update Informations
        updateUI();
    }

    @SuppressLint("SetTextI18n")
    private void updateUI() {
        if(MainActivity.p == 0)
        {
            distance = distance + (lStart.distanceTo(lEnd)/1000.00);
            MainActivity.endTime = System.currentTimeMillis();
            long diff = MainActivity.endTime - MainActivity.startTime;
            diff = TimeUnit.MILLISECONDS.toMinutes(diff);


            MainActivity.time.setText("Timpul total : "+diff+" minute");
            MainActivity.distance.setText(new DecimalFormat("#.####").format(distance)+ "Km's");
            lStart = lEnd;
        }
    }
    
    @Override
    public boolean onUnbind(Intent intent)
    {
      stopLocationUpdates();
      if(mGoogleApiClient.isConnected())
          mGoogleApiClient.disconnect();
      lStart = lEnd =null;
      distance = 0;
         return super.onUnbind(intent);
    }

    private void stopLocationUpdates() {
        PendingResult<Status> statusPendingResult = LocationServices.FusedLocationApi.removeLocationUpdates(mGoogleApiClient, this);
        distance = 0;

    }

    public class LocalBinder extends Binder {
        public LocationService getService(){
            return LocationService.this;
        }
    }
}
