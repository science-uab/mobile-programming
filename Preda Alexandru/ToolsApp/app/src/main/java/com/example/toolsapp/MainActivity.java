/**
 * Author: Preda Alexandru
 Email: alexpreda95@yahoo.com
 Copyright (c) [2018] [Preda Alexandru]
 */
package com.example.toolsapp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.Button;
import android.widget.Toast;

import static android.app.PendingIntent.getActivity;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button button1 = (Button) findViewById(R.id.simpleButton2);
        button1.setOnClickListener((View.OnClickListener) this);

        Button button2 = (Button) findViewById(R.id.simpleButton);
        button2.setOnClickListener((View.OnClickListener) this);

        Button button3 = (Button) findViewById(R.id.simpleButton3);
        button3.setOnClickListener((View.OnClickListener) this);
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.simpleButton2:
                Intent intent1 = new Intent(MainActivity.this, FlashlightAct.class);
                startActivity(intent1);
                break;
            case R.id.simpleButton:
                Intent intent2 = new Intent(MainActivity.this, SpeechRec.class);
                startActivity(intent2);
                break;
            case R.id.simpleButton3:
                Intent intent3 = new Intent(MainActivity.this, Camera.class);
                startActivity(intent3);
                break;

            default:
                break;
        }
    }
}
