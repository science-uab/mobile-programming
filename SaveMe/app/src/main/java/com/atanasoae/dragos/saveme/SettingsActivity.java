package com.atanasoae.dragos.saveme;

/**
 * Project "Save Me"
 * Created by Dragos Atanasoae
 * Email: dragos.atanasoae@gmail.com
 * University "1 Decembrie 1918" Alba-Iulia
 * MIT License
 * Copyright (c) 2018 Dragos Atanasoae
 */

import android.Manifest;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Switch;

import static com.atanasoae.dragos.saveme.MapsActivity.PERMISSION_ALL;

public class SettingsActivity extends AppCompatActivity implements CompoundButton.OnCheckedChangeListener {

    final static String[] PERMISSIONS = {android.Manifest.permission.ACCESS_COARSE_LOCATION,
            Manifest.permission.ACCESS_FINE_LOCATION};
    Switch onOffService;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);


        ImageButton GPSonOff = (ImageButton)findViewById(R.id.btnOnOffGPS);
        GPSonOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showAlert(1);
            }
        });

        onOffService = (Switch) findViewById(R.id.switch1);
        onOffService.setOnCheckedChangeListener(this);

    }


    private void showAlert(final int status) {
        String message, title, btnText;
        if (status == 1) {
            message = "If your Locations Settings is set to 'Off'.\nPlease Enable Location to " +
                    "use this app";
            title = "Enable Location";
            btnText = "Location Settings";
        } else {
            message = "Please allow this app to access location!";
            title = "Permission access";
            btnText = "Grant";
        }
        final AlertDialog.Builder dialog = new AlertDialog.Builder(this);
        dialog.setCancelable(false);
        dialog.setTitle(title)
                .setMessage(message)
                .setPositiveButton(btnText, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface paramDialogInterface, int paramInt) {
                        if (status == 1) {
                            Intent myIntent = new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS);
                            startActivity(myIntent);
                        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                            requestPermissions(PERMISSIONS, PERMISSION_ALL);
                        }
                    }
                })
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface paramDialogInterface, int paramInt) {
                        finish();
                    }
                });
        dialog.show();
    }

    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        if (onOffService.isChecked()){

            startService(new Intent(this, TorchService.class));

        } else {

            stopService(new Intent(this, TorchService.class));

        }
    }
}
