package com.atanasoae.dragos.saveme;

/**
 * Project "Save Me"
 * Created by Dragos Atanasoae
 * Email: dragos.atanasoae@gmail.com
 * University "1 Decembrie 1918" Alba-Iulia
 * MIT License
 * Copyright (c) 2018 Dragos Atanasoae
 */

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraManager;
import android.os.Build;
import android.os.IBinder;
import android.support.annotation.Nullable;

/**
 * Created by Dragos on 30.01.2018.
 */

public class TorchService extends Service {

    private SensorManager sensorManager;

    private float accelVal;  // current acceleration value and gravity
    private float accelLast;    // last acceleration value and gravity
    private float shake;    // acceleration value differ from gravity

    private CameraManager cameraManager;
    private String CM_Id;
    private Boolean isTorchOn;

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {

        sensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        sensorManager.registerListener(sensorListner, sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER), SensorManager.SENSOR_DELAY_NORMAL);

        accelVal = SensorManager.GRAVITY_EARTH;
        accelLast = SensorManager.GRAVITY_EARTH;
        shake = 0.00f;

        cameraManager = (CameraManager) getSystemService(Context.CAMERA_SERVICE);
        try {
            CM_Id = cameraManager.getCameraIdList()[0];
        } catch(CameraAccessException e) {
            e.printStackTrace();
        }

        isTorchOn = false;

        return START_STICKY;

    }

    private final SensorEventListener sensorListner = new SensorEventListener() {
        @Override
        public void onSensorChanged(SensorEvent event) {

            float x = event.values[0];
            float y = event.values[1];
            float z = event.values[2];

            accelLast = accelVal;
            accelVal = (float) Math.sqrt((double) (x*x + y*y + z*z));
            float delta = accelVal-accelLast;
            shake = shake * 0.9f + delta;

            if (shake > 12) {


                turnOn();


            }

        }

        @Override
        public void onAccuracyChanged(Sensor sensor, int accuracy) {

        }
    };

    public void turnOn() {
        try {
            if (Build.VERSION.SDK_INT >= 23) {
                cameraManager.setTorchMode(CM_Id, true);
            }
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }


    }

    public void turnOff() {
        try {
            if (Build.VERSION.SDK_INT >= 23) {
                cameraManager.setTorchMode(CM_Id, false);
            }
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        turnOff();
    }
}
