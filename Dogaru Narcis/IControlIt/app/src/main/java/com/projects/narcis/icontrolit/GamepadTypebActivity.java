/* Dogaru Narcis-George
    narcisgeorge.dogaru@gmail.com
    MIT License
 */

package com.projects.narcis.icontrolit;

import android.bluetooth.BluetoothSocket;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.res.Resources;
import android.graphics.Color;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.projects.narcis.icontrolit.Bluetooth.BluetoothConnectedThread;
import com.projects.narcis.icontrolit.Bluetooth.BluetoothService;
import com.projects.narcis.icontrolit.MyHandlers.LogHandler;
import com.projects.narcis.icontrolit.MyHandlers.ToastHandler;

import java.util.ArrayList;
import java.util.List;

import static com.projects.narcis.icontrolit.MainActivity.bluetoothAdapter;
import static com.projects.narcis.icontrolit.MainActivity.connectState;


//Gamepad type B activity
public class GamepadTypebActivity extends AppCompatActivity implements SensorEventListener {

    private ImageView leftIndicator, rightIndicator;
    TextView buttonA, buttonB, buttonC, buttonD;

    private Sensor sensor;
    private SensorManager sensorManager;

    private LogHandler logHandler;
    private ToastHandler toastHandler;

    //Constant used as keys, to be send to server. Server will recognize the command by received keys.
    private final int PAD_B = 140;
    private final int GO_LEFT = 141;
    private final int GO_RIGHT = 142;
    private final int BUTTON_A_DOWN = 143;
    private final int BUTTON_A_UP = 144;
    private final int BUTTON_B_DOWN = 145;
    private final int BUTTON_B_UP = 146;
    private final int BUTTON_C_DOWN = 147;
    private final int BUTTON_C_UP = 148;
    private final int BUTTON_D_DOWN = 149;
    private final int BUTTON_D_UP = 150;
    private final int STOP = 151;

    //Variables that used to check if button is pressed or not (1 - pressed, 0 - released)
    private int a_down = 0;
    private int b_down = 0;
    private int c_down = 0;
    private int d_down = 0;
    private int left = 0;
    private int right = 0;

    private BluetoothService bluetoothService;
    private BluetoothSocket bluetoothSocket;
    private BluetoothConnectedThread connectedThread;

    private final int WAIT = 2;
    private boolean canRun = false;
    private Resources resources;

    //Handler used to update Interface
    private Handler handler = new Handler() {
        @Override
        public void handleMessage(Message message) {
            toastHandler.showToast("READY");
            leftIndicator.setImageResource(R.color.dark_red);
            rightIndicator.setImageResource(R.color.dark_red);
            buttonA.setBackgroundColor(resources.getColor(R.color.holo_purple));
            buttonB.setBackgroundColor(resources.getColor(R.color.dark_green));
            buttonC.setBackgroundColor(resources.getColor(R.color.dark_blue));
            buttonD.setBackgroundColor(resources.getColor(R.color.dark_orange));
        }

    };

    private Thread keyEvent;
    private boolean run = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_gamepad_typeb);

        leftIndicator = (ImageView)findViewById(R.id.leftIndicator);
        rightIndicator = (ImageView)findViewById(R.id.rightIndicator);
        buttonA = (TextView) findViewById(R.id.buttonA);
        buttonB = (TextView)findViewById(R.id.buttonB);
        buttonC = (TextView)findViewById(R.id.buttonC);
        buttonD = (TextView)findViewById(R.id.buttonD);

        logHandler = new LogHandler("log-gameb");
        toastHandler = new ToastHandler(GamepadTypebActivity.this);
        resources = GamepadTypebActivity.this.getResources();

        //If bluetooth adapter is enabled bound activity
        if(bluetoothAdapter.isEnabled()) {
            if(connectState == true) {
                Intent intent = new Intent(GamepadTypebActivity.this, BluetoothService.class);
                bindService(intent, serviceConnection, Context.BIND_AUTO_CREATE);
            }
        }

        //Creating a sensor managerobject, to get the desired sensor.
        sensorManager = (SensorManager)getSystemService(SENSOR_SERVICE);
        sensor = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        //Registering sensor to this activity
        sensorManager.registerListener(this, sensor, SensorManager.SENSOR_DELAY_NORMAL);

        buttonA.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        a_down = 1;
                        break;
                    case MotionEvent.ACTION_UP:
                        a_down = 0;
                        break;
                }

                return true;
            }
        });

        buttonB.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        b_down = 1;
                        break;
                    case MotionEvent.ACTION_UP:
                        b_down = 0;
                        break;
                }

                return true;
            }
        });

        buttonC.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        c_down = 1;
                        break;
                    case MotionEvent.ACTION_UP:
                        c_down = 0;
                        break;
                }

                return true;
            }
        });

        buttonD.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        d_down = 1;
                        break;
                    case MotionEvent.ACTION_UP:
                        d_down = 0;
                        break;
                }

                return true;
            }
        });

        //Thread used to wait 2 second, before use the gamepad.
        Thread waitThread = new Thread(new Runnable() {
            @Override
            public void run() {
                int x = 0;
                while (x <= WAIT) {
                    try {
                        x++;
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                canRun = true;
                handler.sendEmptyMessage(0);
            }
        });

        waitThread.start();

        //Thread used to send data through bluetooth.
        keyEvent = new Thread(new Runnable() {
            @Override
            public void run() {
                while(run) {
                    try {
                        List<String> values = new ArrayList<>();
                        //Used switch to check if button is pressed or released
                        switch(a_down){
                            case 1:
                                values.add(str(BUTTON_A_DOWN));
                                break;
                            case 0:
                                values.add(str(BUTTON_A_UP));
                                break;
                        }

                        switch(b_down){
                            case 1:
                                values.add(str(BUTTON_B_DOWN));
                                break;
                            case 0:
                                values.add(str(BUTTON_B_UP));
                                break;
                        }

                        switch(c_down){
                            case 1:
                                values.add(str(BUTTON_C_DOWN));
                                break;
                            case 0:
                                values.add(str(BUTTON_C_UP));
                                break;
                        }

                        switch(d_down){
                            case 1:
                                values.add(str(BUTTON_D_DOWN));
                                break;
                            case 0:
                                values.add(str(BUTTON_D_UP));
                                break;
                        }

                        switch(left){
                            case 1:
                                values.add(str(GO_LEFT));
                                break;
                            case 0:
                                values.add(str(STOP));
                                break;
                        }

                        switch (right) {
                            case 1:
                                values.add(str(GO_RIGHT));
                                break;
                            case 0:
                                values.add(str(STOP));
                                break;

                        }

                        //Adding all buttons status (pressed or released), and send through bluetooth
                        String[] data = values.toArray(new String[values.size()]);
                        if(canRun == true) {
                            sendData(PAD_B, TextUtils.join("-", data));
                        }

                        Thread.sleep(50);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        });

        keyEvent.start();
    }

    //Listening for sensor changing
    @Override
    public void onSensorChanged(SensorEvent event) {
        int value =  (int) event.values[1];
        final int SENSITIVITY = 2;

        if(canRun == true) {
            if (value <= -SENSITIVITY) {
                leftIndicator.setImageResource(R.color.blue_bright);
                left = 1;
            } else if (value >= SENSITIVITY) {
                rightIndicator.setImageResource(R.color.blue_bright);
                right = 1;
            } else {
                leftIndicator.setImageResource(R.color.dark_red);
                rightIndicator.setImageResource(R.color.dark_red);
                left = 0;
                right = 0;
            }
        }
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {

    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        run = false;
        keyEvent = null;
    }

    //Creating the service connection to be able to bound activity to service
    public ServiceConnection serviceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            BluetoothService.LocalBinder localBinder = (BluetoothService.LocalBinder)service;
            bluetoothService = localBinder.getService();

            bluetoothSocket = bluetoothService.getSocket();

            if(bluetoothSocket != null) {
                connectedThread = new BluetoothConnectedThread(bluetoothSocket);
            } else {
                logHandler.log("Socket is null");
            }
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            connectedThread = null;
        }
    };

    private void sendData(int key, String value) {
        if(bluetoothAdapter.isEnabled()) {
            if(connectState == true) {
                connectedThread.write(key, value);
            }
        }
    }

    private String str(int value) {
        return String.valueOf(value);
    }
}
