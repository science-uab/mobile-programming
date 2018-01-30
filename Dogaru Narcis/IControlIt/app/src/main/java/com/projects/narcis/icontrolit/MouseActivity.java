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
import android.os.IBinder;
import android.provider.ContactsContract;
import android.support.annotation.StringDef;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.projects.narcis.icontrolit.Bluetooth.BluetoothConnectedThread;
import com.projects.narcis.icontrolit.Bluetooth.BluetoothService;
import com.projects.narcis.icontrolit.MyHandlers.LogHandler;
import com.projects.narcis.icontrolit.MyHandlers.ToastHandler;

import static com.projects.narcis.icontrolit.MainActivity.bluetoothAdapter;
import static com.projects.narcis.icontrolit.MainActivity.connectState;

//Mouse pad activity
public class MouseActivity extends AppCompatActivity {

    private ImageView touchPad, leftClick, rightClick;

    private int auxX = 0;
    private int auxY = 0;
    private int xPixels = 0;
    private int yPixels = 0;
    private int startX = 0;
    private int startY = 0;
    int currentX = 0;
    int currentY = 0;

    private BluetoothService bluetoothService;
    private BluetoothSocket bluetoothSocket;
    private BluetoothConnectedThread connectedThread;
    private LogHandler logHandler;

    //Constant used as keys, to be send to server. Server will recognize the command by received keys.
    private final int CURSOR = 110;
    private final int CLICK = 111;
    private final int LEFT_DOWN = 112;
    private final int LEFT_UP = 113;
    private final int RIGHT_DOWN = 114;
    private final int RIGHT_UP = 115;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mouse);

        logHandler = new LogHandler("log-mouse");

        touchPad = (ImageView)findViewById(R.id.mousePad);
        leftClick = (ImageView)findViewById(R.id.leftClick);
        rightClick = (ImageView)findViewById(R.id.rightClick);

        //If bluetooth adapter is enbaled, bind activity to service
        if(bluetoothAdapter.isEnabled()) {
            if(connectState == true) {
                Intent intent = new Intent(MouseActivity.this, BluetoothService.class);
                bindService(intent, serviceConnection, Context.BIND_AUTO_CREATE);
            }
        }

        //Mouse touchpad listener
        touchPad.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        startX = (int) event.getX() - v.getLeft();
                        startY = (int) event.getY() - v.getLeft();
                        break;

                    case MotionEvent.ACTION_MOVE:
                        float vWidth = v.getWidth();
                        float vHeight = v.getHeight();

                        float x = event.getX() - v.getLeft();
                        float y = event.getY() - v.getTop();

                        //Received touch coordonaties only when mouse area is touched
                        if(x < vWidth && y < vHeight && x > v.getLeft() && y > v.getTop()) {

                            xPixels = (int) x;
                            yPixels = (int) y;

                            int a = 0;
                            int b = 0;

                            if (startX < xPixels) {
                                if (auxX < xPixels) {
                                    //Cursor go right
                                    a = xPixels - startX;
                                } else if (auxX == xPixels) {
                                    a = 0;
                                    //Cursor stop
                                } else {
                                    a = startX - xPixels;
                                    //Cursor go left
                                }
                            } else {
                                if (auxX > xPixels) {
                                    a = xPixels - startX;
                                    //Cursor go right
                                } else if (auxX == xPixels) {
                                    a = 0;
                                    //Cursor stop
                                } else {
                                    a = startX - xPixels;
                                    //Cursor go left
                                }
                            }

                            if (startY < yPixels) {
                                if (auxY < yPixels) {
                                    b = yPixels - startY;
                                    //Cursor go down
                                } else if (auxY == yPixels) {
                                    b = 0;
                                    //Cursor stop
                                } else {
                                    b = startY - yPixels;
                                    //Cursor go up
                                }
                            } else {
                                if (auxY > yPixels) {
                                    b = yPixels - startY;
                                    //Cursor go down
                                } else if (auxY == yPixels) {
                                    b = 0;
                                    //Cursor stop
                                } else {
                                    b = startY - yPixels;
                                    //Cursor go up
                                }
                            }

                            auxX = xPixels;
                            auxY = yPixels;

                            //Cursor sensitivity
                            String coords = a/40 + "," + b/40;

                            logHandler.log(coords);
                            sendData(110, coords);

                        }
                        break;

                    case MotionEvent.ACTION_CANCEL:
                    case MotionEvent.ACTION_UP:
                        auxX = 0;
                        auxY = 0;
                        xPixels = 0;
                        yPixels = 0;
                        break;
                }

                return true;
            }
        });

        leftClick.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {

                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        sendData(CLICK,LEFT_DOWN);
                        break;
                    case MotionEvent.ACTION_CANCEL:
                    case MotionEvent.ACTION_UP:
                        sendData(CLICK,LEFT_UP);
                        break;
                }

                return true;
            }
        });

        rightClick.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        sendData(CLICK,RIGHT_DOWN);
                        break;
                    case MotionEvent.ACTION_CANCEL:
                    case MotionEvent.ACTION_UP:
                        sendData(CLICK,RIGHT_UP);
                        break;
                }
                return true;
            }
        });
    }

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

    private void sendData(int key, int value) {
        if(bluetoothAdapter.isEnabled()) {
            if(connectState == true) {
                connectedThread.write(key, value);
            }
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
}
