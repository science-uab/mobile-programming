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
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.SeekBar;

import com.projects.narcis.icontrolit.Bluetooth.BluetoothConnectedThread;
import com.projects.narcis.icontrolit.Bluetooth.BluetoothService;
import com.projects.narcis.icontrolit.MyHandlers.LogHandler;
import com.projects.narcis.icontrolit.MyHandlers.ToastHandler;

import static com.projects.narcis.icontrolit.MainActivity.bluetoothAdapter;
import static com.projects.narcis.icontrolit.MainActivity.connectState;


//Media player acitivty
public class MediaPlayerActivity extends AppCompatActivity {

    private ImageView buttonBack3, buttonPrev, buttonNext, buttonPlay, buttonDown, buttonUp, buttonMute;
    private boolean playing = false;

    private ToastHandler toastHandler;

    private final int VOLUME_DATA = 120;
    private final int PREV = 122;
    private final int NEXT = 123;
    private final int PLAY_PAUSE = 124;
    private final int VOLUME_UP = 126;
    private final int VOLUME_DOWN = 127;
    private final int VOLUME_MUTE = 128;

    private BluetoothService bluetoothService;
    private BluetoothSocket bluetoothSocket;
    private BluetoothConnectedThread connectedThread;
    private LogHandler logHandler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_media_player);

        buttonBack3 = (ImageView)findViewById(R.id.buttonBack3);
        buttonPrev = (ImageView)findViewById(R.id.buttonPrev);
        buttonNext = (ImageView)findViewById(R.id.buttonNext);
        buttonPlay = (ImageView)findViewById(R.id.buttonPlay);
        buttonDown = (ImageView)findViewById(R.id.buttonDown);
        buttonUp = (ImageView)findViewById(R.id.buttonUp);
        buttonMute = (ImageView)findViewById(R.id.buttonMute);

        toastHandler = new ToastHandler(MediaPlayerActivity.this);
        logHandler = new LogHandler("log-media");

        if(bluetoothAdapter.isEnabled()) {
            if(connectState == true) {
                Intent intent = new Intent(MediaPlayerActivity.this, BluetoothService.class);
                bindService(intent, serviceConnection, Context.BIND_AUTO_CREATE);
            }
        }

        buttonBack3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        buttonPrev.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendData(VOLUME_DATA,PREV);
            }
        });

        buttonNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendData(VOLUME_DATA,NEXT);
            }
        });

        buttonPlay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(playing == true) {
                    buttonPlay.setImageResource(R.mipmap.pause);
                    playing = false;
                    sendData(VOLUME_DATA,PLAY_PAUSE);
                } else {
                    buttonPlay.setImageResource(R.mipmap.play);
                    playing = true;
                    sendData(VOLUME_DATA,PLAY_PAUSE);
                }
            }
        });

        buttonDown.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendData(VOLUME_DATA,VOLUME_DOWN);
                logHandler.log("DOWN");
            }
        });

        buttonMute.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendData(VOLUME_DATA,VOLUME_MUTE);
            }
        });

        buttonUp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendData(VOLUME_DATA,VOLUME_UP);
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
}
