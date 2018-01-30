/*
Tomuta Dan-Claudiu
dan_tomuta@yahoo.com

+MIT License
 +
 +Copyright (c) 2018 danclaudiu95
 +
 +Permission is hereby granted, free of charge, to any person obtaining a copy
 +of this software and associated documentation files (the "Software"), to deal
 +in the Software without restriction, including without limitation the rights
 +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 +copies of the Software, and to permit persons to whom the Software is
 +furnished to do so, subject to the following conditions:
 */

package com.example.dannyetlv.balleater;

import android.app.usage.UsageEvents;
import android.content.Context;
import android.content.Intent;
import android.graphics.Point;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Display;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;


import org.w3c.dom.Text;

import java.util.Timer;
import java.util.TimerTask;



public class MainActivity extends AppCompatActivity  {



    @Override
    public Object getSystemService(@NonNull String name) {
        return super.getSystemService(name);
    }

    private TextView scoreLabel;
        //create variabiles for each object in the game
        private TextView startLabel;

        private ImageView box;

        private ImageView red;

        private ImageView yellow;

        private ImageView blue;

        private ImageView bomb;

        //Size
        private int frameHeight;
        private int boxSize;
        private int screenWidth;
        private int screenHeight;

        //set position variabiles for the object in the game
        //Position
        private int boxY;
        private int redX;
        private int redY;
        private int yellowX;
        private int yellowY;
        private int blueX;
        private int blueY;
        private int bombX;
        private int bombY;

        //Score
        private int score = 0;


        //Initialize class
        private Handler handler = new Handler();
        private Timer timer = new Timer();
        private SoundPlayer sound;

        //Status check
        private boolean action_flg = false;
        private boolean start_flg = false;


    @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_main);


            sound = new SoundPlayer(this);

        scoreLabel = (TextView) findViewById(R.id.scoreLabel);
        startLabel = (TextView) findViewById(R.id.startLabel);



        box = (ImageView) findViewById(R.id.box);

        red = (ImageView) findViewById(R.id.red);

        yellow = (ImageView) findViewById(R.id.yellow);

        blue = (ImageView) findViewById(R.id.blue);

        bomb = (ImageView) findViewById(R.id.bomb);


        //Get screen size
            WindowManager wm = getWindowManager();
            Display disp = wm.getDefaultDisplay();
            Point size = new Point();
            disp.getSize(size);

            screenWidth = size.x;
            screenHeight = size.y;

        //Move to out of screen

        red.setX(-80);

        red.setY(-80);

        yellow.setX(-80);

        yellow.setY(-80);

        blue.setX(-80);

        blue.setY(-80);

        bomb.setX(-80);

        bomb.setY(-80);

            scoreLabel.setText("Score :  0");

        boxY = 500;

        }

    //make randomly positions of the next ball that will move from the right to the left
    public void changePos() {
            hitCheck();
            //Red
            //when the red ball leaves the screen a new one starts from the right
            redX -= 12;
            if (redX < 0) {
                redX = screenWidth + 20;
                redY = (int) Math.floor(Math.random()*(frameHeight-red.getHeight()));
            }
            red.setX(redX);
            red.setY(redY);

            //Yellow
            //when the Yellow ball leaves the screen a new one starts from the right
            yellowX -= 16;
            if (yellowX < 0) {
                yellowX = screenWidth + 10;
                yellowY = (int) Math.floor(Math.random()*(frameHeight-yellow.getHeight()));
            }
            yellow.setX(yellowX);
            yellow.setY(yellowY);


            //Blue
            //when the Yellow ball leaves the screen a new one starts from the right
            blueX -= 20;
            if (blueX < 0) {
                blueX = screenWidth + 50;
                blueY = (int) Math.floor(Math.random()*(frameHeight-blue.getHeight()));
            }
            blue.setX(blueX);
            blue.setY(blueY);

            //Bomb
            //when the bomb leaves the screen a new one starts from the right. I set the "distance" to 5000
            //so that the bomb goes rarely
            bombX -= 16;
            if (bombX < 0) {
                bombX = screenWidth + 5000;
                bombY = (int) Math.floor(Math.random()*(frameHeight-bomb.getHeight()));
            }
            bomb.setX(bombX);
            bomb.setY(bombY);


            //Move Box
            if (action_flg == true) {
                //Touching
                boxY -= 20;
            }
            else {
                //Releasing
                boxY += 20;

            }

            //Check box position
            if (boxY < 0 ) boxY = 0;

            if (boxY > frameHeight - boxSize) boxY = frameHeight - boxSize;
            box.setY(boxY);

            scoreLabel.setText("Score : " + score);
        }


        public void hitCheck(){
            //If the center of the ball is in the box, it counts as a hit

        //Red
        int redCenterX = redX + red.getWidth() / 2;
        int redCenterY = redY + red.getHeight() / 2;
        if (0 <= redCenterX && redCenterX <= boxSize &&
                boxY <= redCenterY && redCenterY <= boxY + boxSize) {
            score += 100;
            redX = -10;
            sound.playHitSound();
        }

        //Yellow
        int yellowCenterX = yellowX + yellow.getWidth() / 2;
        int yellowCenterY = yellowY + red.getHeight() / 2;
        if (0 <= yellowCenterX && yellowCenterX <= boxSize &&
                boxY <= yellowCenterY && yellowCenterY <= boxY + boxSize) {
            score += 50;
            yellowX = -10;
            sound.playHitSound();
        }

        //Blue
        int blueCenterX = blueX + blue.getWidth() / 2;
        int blueCenterY = blueY + blue.getHeight() / 2;
        if (0 <= blueCenterX && blueCenterX <= boxSize &&
                boxY <= blueCenterY && blueCenterY <= boxY + boxSize) {
            score += 30;
            blueX = -10;
            sound.playHitSound();
        }

        //Bomb
        int bombCenterX = bombX + bomb.getWidth() / 2;
        int bombCenterY = bombY + bomb.getHeight() / 2;
        if (0 <= bombCenterX && bombCenterX <= boxSize &&
                boxY <= bombCenterY && bombCenterY <= boxY + boxSize) {

            //Stop timer
            timer.cancel();
            timer = null;

            sound.playOverSound();

            //Show result
            Intent intent = new Intent(getApplicationContext(), result.class);
            intent.putExtra("SCORE", score);
            startActivity(intent);
        }
    }
        //When I touch the screen the box moves upward
        public boolean onTouchEvent(MotionEvent me) {

            if(start_flg == false) {
                start_flg = true;


                FrameLayout frame = (FrameLayout) findViewById(R.id.frame);
                frameHeight = frame.getHeight();

                boxY = (int) box.getY();

                //the box is a square (height and width are the same)
                boxSize = box.getHeight();

                startLabel.setVisibility(View.GONE);

                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        handler.post(new Runnable() {
                            @Override
                            public void run() {
                                //call changePos every 20 seconds
                                changePos();

                            }
                        });
                    }
                }, 0, 20);
            }
            else{
                if (me.getAction() == MotionEvent.ACTION_DOWN) {

                    action_flg = true;

                } else if (me.getAction() == MotionEvent.ACTION_UP) {
                    action_flg = false;
                }
            }
            return true;
        }
    }
