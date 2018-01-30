package com.atanasoae.dragos.saveme;
/**
 * Project "Save Me"
 * Created by Dragos Atanasoae
 * Email: dragos.atanasoae@gmail.com
 * University "1 Decembrie 1918" Alba-Iulia
 * MIT License
 * Copyright (c) 2018 Dragos Atanasoae
 */

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;

public class SplashScreen extends AppCompatActivity {

    private TextView tv;
    private ImageView iv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);
        tv = (TextView) findViewById(R.id.textView);
        iv = (ImageView) findViewById(R.id.imageView);
        Animation splash_transition = AnimationUtils.loadAnimation(this, R.anim.splash_transition);
        tv.startAnimation(splash_transition);
        iv.startAnimation(splash_transition);
        final Intent i = new Intent(this, MainActivity.class);

        Thread timer = new Thread() {
            public void run (){
                try {
                    sleep(5000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                finally {
                    startActivity(i);
                    finish();
                }
            }
        };

        timer.start();
    }
}
