package com.example.alexa.testyoursensors;

/**
 * Project "Test Your Sensors"
 * Created by Bala Alexandru
 * Email: alexandrubala94@gmail.com
 * University "1 Decembrie 1918" Alba Iulia
 * MIT License
 * Copyright (c) 2018 Bala Alexandru
 */

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.alexa.testyoursensors.sensors.BarometerSensor;
import com.example.alexa.testyoursensors.sensors.CheckSensors;
import com.example.alexa.testyoursensors.sensors.GyroscopeSensor;
import com.example.alexa.testyoursensors.sensors.LightSensor;
import com.example.alexa.testyoursensors.sensors.MagneticSensor;
import com.example.alexa.testyoursensors.sensors.OrientationSensor;
import com.example.alexa.testyoursensors.sensors.ProximitySensor;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button sendToCheckSensors = findViewById(R.id.check);
        sendToCheckSensors.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, CheckSensors.class);
                startActivity(intent);
            }
        });

        Button sendToGyroscope = findViewById(R.id.gyroscope);
        sendToGyroscope.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, GyroscopeSensor.class);
                startActivity(intent);
            }
        });

        Button sendToProximity = findViewById(R.id.proximity);
        sendToProximity.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, ProximitySensor.class);
                startActivity(intent);
            }
        });

        Button sendToOrientation = findViewById(R.id.orientation);
        sendToOrientation.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, OrientationSensor.class);
                startActivity(intent);
            }
        });

        Button sendToBarometer = findViewById(R.id.barometer);
        sendToBarometer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, BarometerSensor.class);
                startActivity(intent);
            }
        });

        Button sendToLight = findViewById(R.id.lights);
        sendToLight.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, LightSensor.class);
                startActivity(intent);
            }
        });

        Button sendToMagnetic = findViewById(R.id.magnetics);
        sendToMagnetic.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, MagneticSensor.class);
                startActivity(intent);
            }
        });

    }


}
