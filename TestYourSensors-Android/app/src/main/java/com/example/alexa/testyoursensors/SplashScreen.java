package com.example.alexa.testyoursensors;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;

public class SplashScreen extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);
        TextView tv = findViewById(R.id.appName);
        ImageView iv = findViewById(R.id.imageViewProfile);
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