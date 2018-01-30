/* Dogaru Narcis-George
    narcisgeorge.dogaru@gmail.com
    MIT License
 */

package com.projects.narcis.icontrolit;

import android.bluetooth.BluetoothAdapter;
import android.content.Intent;
import android.support.v4.view.VelocityTrackerCompat;
import android.support.v4.widget.Space;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutCompat;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.widget.GridLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.projects.narcis.icontrolit.Bluetooth.BluetoothActivity;
import com.projects.narcis.icontrolit.Bluetooth.BluetoothService;
import com.projects.narcis.icontrolit.MyHandlers.ToastHandler;


//Home page activity
public class MainActivity extends AppCompatActivity {

    private LinearLayout buttonBluetooth, buttonMousepad, buttonMediaPlayer, buttonGamepadA, buttonGamepadB, buttonSettings;
    public static BluetoothAdapter bluetoothAdapter = null;
    public static boolean connectState = false;
    //Creating an intent variable, to start the application's service.
    private Intent serviceIntent;

    private ToastHandler toastHandler;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        toastHandler = new ToastHandler(MainActivity.this);

        serviceIntent = new Intent(MainActivity.this, BluetoothService.class);

        buttonBluetooth = (LinearLayout) findViewById(R.id.buttonBluetooth);
        buttonMousepad = (LinearLayout) findViewById(R.id.buttonMouse);
        buttonMediaPlayer = (LinearLayout)findViewById(R.id.buttonPlayer);
        buttonGamepadA = (LinearLayout)findViewById(R.id.buttonGamepad);
        buttonGamepadB = (LinearLayout)findViewById(R.id.buttonGamepadB);

        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

        //Checking if the device has a bluetooth adapter.
        if(bluetoothAdapter == null) {
            toastHandler.showToast("This device doesn't support bluetooth or your adapter is not working!");
        }

        //Creating listeners for buttons
        buttonBluetooth.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, BluetoothActivity.class);
                startActivity(intent);
            }
        });

        buttonMousepad.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, MouseActivity.class);
                startActivity(intent);
            }
        });

        buttonMediaPlayer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, MediaPlayerActivity.class);
                startActivity(intent);
            }
        });

        buttonGamepadA.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, GamepadTypeaActivity.class);
                startActivity(intent);
            }
        });

        buttonGamepadB.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, GamepadTypebActivity.class);
                startActivity(intent);
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();

        //Check if bluetooth adapter is ON to start service, or OFF to stop service for optimizing
        if(bluetoothAdapter.isEnabled()) {
            startService(serviceIntent);
        } else {
            stopService(serviceIntent);
        }
    }
}
