package com.company.radugoada.stillcam;

import android.content.Context;
import android.content.res.Configuration;
import android.hardware.Camera;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import java.io.IOException;
import java.util.List;

/*
 MIT License

 Copyright (c) 2018 Radu Goadă

 Email: radu.goada@gmail.com

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 */

public class ShowCamera extends SurfaceView implements SurfaceHolder.Callback {

    Camera camera;  //initialize Camera hardware
    SurfaceHolder holder;

    public ShowCamera(Context context, Camera camera) {
        super(context);
        this.camera = camera;
        holder = getHolder();
        holder.addCallback(this);

    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {

    }

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) { //added destructor
        camera.stopPreview(); //stops the camera preview
        camera.release();

    }

    @Override  //surfaceCreated method will be called in ShowCamera()
    public void surfaceCreated(SurfaceHolder holder) { //constructor
        //setting parameters for the Camera itself
        Camera.Parameters params = camera.getParameters();

        //initialize camera to get the resolution sizes
        List<Camera.Size> sizes = params.getSupportedPictureSizes();
        Camera.Size mSize = null;

        for(Camera.Size size : sizes)
        {
            mSize = size;
        }

        //change orientation of the device camera
        if (this.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE) {

            params.set("orientation", "portrait"); //setting parameters for device orientation in Portrait
            camera.setDisplayOrientation(90);
            params.setRotation(90);
        }

        else{

            params.set("orientation","landscape"); //setting parameters for device orientation in Landscape
            camera.setDisplayOrientation(0);
            params.setRotation(90);
        }
        params.setPictureSize(mSize.width, mSize.height); //set parameters for resolution image size Width and Height
        camera.setParameters(params);
        try{

            camera.setPreviewDisplay(holder);
            camera.startPreview();

        }catch (IOException e) //solving IOException error in Java
        {
            e.printStackTrace();
        }

    }
}
