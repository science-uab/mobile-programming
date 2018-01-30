/**
 * Author: Preda Alexandru
 Email: alexpreda95@yahoo.com
 Copyright (c) [2018] [Preda Alexandru]
 */
package com.example.toolsapp;

/**
 * Created by Alex on 29.01.2018.
 */

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ToggleButton;


public class FlashlightAct extends AppCompatActivity {
    private ToggleButton switchButton;
    private View mainView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_flashlight);


        switchButton=(ToggleButton)findViewById(R.id.lightSwitch);
        switchButton.setChecked(false);
        switchButton.setOnClickListener(new View.OnClickListener() {
                                            public void onClick(View view) {
                                                // Is the toggle on?
                                                boolean on = ((ToggleButton) view).isChecked();

                                                if (on) {
                                                    getWindow().getDecorView().findViewById(android.R.id.content).setBackgroundColor(Color.BLACK);
                                                } else {
                                                    getWindow().getDecorView().findViewById(android.R.id.content).setBackgroundColor(Color.WHITE);
                                                }
                                            }
                                        }
        );

    }

}

