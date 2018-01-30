package com.example.alexa.testyoursensors.sensors;

/**
 * Project "Test Your Sensors"
 * Created by Bala Alexandru
 * Email: alexandrubala94@gmail.com
 * University "1 Decembrie 1918" Alba Iulia
 * MIT License
 * Copyright (c) 2018 Bala Alexandru
 */

import android.app.Activity;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

import com.example.alexa.testyoursensors.R;

public class MagneticSensor extends Activity implements SensorEventListener{

    TextView textView;
    private static SensorManager sensorManager;
    private Sensor magneticSensor;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sensor_magnetic);

        textView = (TextView) findViewById(R.id.textView);

        sensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        magneticSensor = sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
    }

    @Override
    protected void onResume() {
        super.onResume();

        if (magneticSensor != null) {
            sensorManager.registerListener(this, magneticSensor, SensorManager.SENSOR_DELAY_NORMAL);
        }else {
            Toast.makeText(this, "The device has no Magnetic sensor!", Toast.LENGTH_SHORT).show();
            finish();
        }
    }

    @Override
    protected void onPause() {
        super.onPause();

        sensorManager.unregisterListener(this);
    }

    @Override
    public void onSensorChanged(SensorEvent sensorEvent) {
        float azimuth = Math.round(sensorEvent.values[0]);
        float pitch = Math.round(sensorEvent.values[0]);
        float roll = Math.round(sensorEvent.values[0]);

        double tesla = Math.sqrt((azimuth * azimuth) + (pitch * pitch) + (roll * roll));

        String text = String.format("%.0f", tesla);
        textView.setText(text + "µT");
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {

    }
}
