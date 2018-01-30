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
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.provider.ContactsContract;
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

//Gamepad type A
public class GamepadTypeaActivity extends AppCompatActivity {

    private ImageView buttonUp, buttonLeft, buttonRight, buttonDown;
    private TextView buttonA, buttonB, buttonC, buttonD, buttonE, buttonF;

    private LogHandler logHandler;
    private ToastHandler toastHandler;

    //Constant used as keys, to be send to server. Server will recognize the command by received keys.
    private final int PAD_A = 160;
    private final int BUTTON_UP = 161;
    private final int BUTTON_LEFT = 161;
    private final int BUTTON_RIGHT = 162;
    private final int BUTTON_DOWN = 163;
    private final int BUTTON_A_DOWN = 164;
    private final int BUTTON_B_DOWN = 165;
    private final int BUTTON_C_DOWN = 166;
    private final int BUTTON_D_DOWN = 167;
    private final int BUTTON_E_DOWN = 168;
    private final int BUTTON_F_DOWN = 169;
    private final int RELEASE = 170;

    //Variables that used to check if button is pressed or not (1 - pressed, 0 - released)
    private int a_down = 0;
    private int b_down = 0;
    private int c_down = 0;
    private int d_down = 0;
    private int e_down = 0;
    private int f_down = 0;
    private int up = 0;
    private int down = 0;
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
            buttonUp.setBackgroundColor(resources.getColor(R.color.dark_green));
            buttonDown.setBackgroundColor(resources.getColor(R.color.dark_green));
            buttonLeft.setBackgroundColor(resources.getColor(R.color.dark_green));
            buttonRight.setBackgroundColor(resources.getColor(R.color.dark_green));
            buttonA.setBackgroundColor(resources.getColor(R.color.dark_red));
            buttonB.setBackgroundColor(resources.getColor(R.color.dark_blue));
            buttonC.setBackgroundColor(resources.getColor(R.color.dark_orange));
            buttonD.setBackgroundColor(resources.getColor(R.color.light_red));
            buttonE.setBackgroundColor(resources.getColor(R.color.light_blue));
            buttonF.setBackgroundColor(resources.getColor(R.color.light_orange));
        }

    };

    private Thread keyEvent;
    private boolean run = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_gamepad_typea);

        buttonUp = (ImageView)findViewById(R.id.buttonUp);
        buttonDown = (ImageView)findViewById(R.id.buttonDown);
        buttonLeft = (ImageView)findViewById(R.id.buttonLeft);
        buttonRight = (ImageView)findViewById(R.id.buttonRight);

        buttonA = (TextView) findViewById(R.id.buttonAa);
        buttonB = (TextView) findViewById(R.id.buttonBa);
        buttonC = (TextView) findViewById(R.id.buttonCa);
        buttonD = (TextView) findViewById(R.id.buttonDa);
        buttonE = (TextView) findViewById(R.id.buttonEa);
        buttonF = (TextView) findViewById(R.id.buttonFa);

        logHandler = new LogHandler("log-gameb");
        toastHandler = new ToastHandler(GamepadTypeaActivity.this);
        resources = GamepadTypeaActivity.this.getResources();

        if(bluetoothAdapter.isEnabled()) {
            if(connectState == true) {
                Intent intent = new Intent(GamepadTypeaActivity.this, BluetoothService.class);
                bindService(intent, serviceConnection, Context.BIND_AUTO_CREATE);
            }
        }

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
                                values.add(str(RELEASE));
                                break;
                        }

                        switch(b_down){
                            case 1:
                                values.add(str(BUTTON_B_DOWN));
                                break;
                            case 0:
                                values.add(str(RELEASE));
                                break;
                        }

                        switch(c_down){
                            case 1:
                                values.add(str(BUTTON_C_DOWN));
                                break;
                            case 0:
                                values.add(str(RELEASE));
                                break;
                        }

                        switch(d_down){
                            case 1:
                                values.add(str(BUTTON_D_DOWN));
                                break;
                            case 0:
                                values.add(str(RELEASE));
                                break;
                        }

                        switch(e_down){
                            case 1:
                                values.add(str(BUTTON_E_DOWN));
                                break;
                            case 0:
                                values.add(str(RELEASE));
                                break;
                        }

                        switch(f_down){
                            case 1:
                                values.add(str(BUTTON_F_DOWN));
                                break;
                            case 0:
                                values.add(str(RELEASE));
                                break;
                        }

                        switch(up){
                            case 1:
                                values.add(str(BUTTON_UP));
                                break;
                            case 0:
                                values.add(str(RELEASE));
                                break;
                        }

                        switch(down){
                            case 1:
                                values.add(str(BUTTON_DOWN));
                                break;
                            case 0:
                                values.add(str(RELEASE));
                                break;
                        }

                        switch(left){
                            case 1:
                                values.add(str(BUTTON_LEFT));
                                break;
                            case 0:
                                values.add(str(RELEASE));
                                break;
                        }

                        switch (right) {
                            case 1:
                                values.add(str(BUTTON_RIGHT));
                                break;
                            case 0:
                                values.add(str(RELEASE));
                                break;

                        }

                        //Adding all buttons status (pressed or released), and send through bluetooth
                        String[] data = values.toArray(new String[values.size()]);
                        if(canRun == true) {
                            sendData(PAD_A, TextUtils.join("-", data));
                        }

                        Thread.sleep(50);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        });

        keyEvent.start();

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

        buttonE.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        e_down = 1;
                        break;
                    case MotionEvent.ACTION_UP:
                        e_down = 0;
                        break;
                }

                return true;
            }
        });

        buttonF.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        f_down = 1;
                        break;
                    case MotionEvent.ACTION_UP:
                        f_down = 0;
                        break;
                }

                return true;
            }
        });

        buttonUp.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        up = 1;
                        break;
                    case MotionEvent.ACTION_UP:
                        up = 0;
                        break;
                }

                return true;
            }
        });

        buttonLeft.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        left = 1;
                        break;
                    case MotionEvent.ACTION_UP:
                        left = 0;
                        break;
                }

                return true;
            }
        });

        buttonRight.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        right = 1;
                        break;
                    case MotionEvent.ACTION_UP:
                        right = 0;
                        break;
                }

                return true;
            }
        });

        buttonDown.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        down = 1;
                        break;
                    case MotionEvent.ACTION_UP:
                        down = 0;
                        break;
                }

                return true;
            }
        });
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
