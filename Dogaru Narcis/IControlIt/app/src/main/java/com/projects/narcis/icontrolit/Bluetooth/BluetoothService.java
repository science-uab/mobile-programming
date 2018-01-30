/* Dogaru Narcis-George
    narcisgeorge.dogaru@gmail.com
    MIT License
 */

package com.projects.narcis.icontrolit.Bluetooth;

import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;

import com.projects.narcis.icontrolit.MyHandlers.LogHandler;

import java.io.IOException;
import java.util.UUID;

/**
 * Created by Narcis on 1/22/2018.
 */

//Bluetooth service
public class BluetoothService extends Service {
    private final IBinder iBinder = new LocalBinder();
    private Handler handler;

    private ConnectThread connectThread;
    private BluetoothConnectedThread connectedThread;
    private int connectionState;
    public static final int STAND_BY = 0;
    public static final int CONNECTING_STATE = 1;
    public static final int CONNECTED_STATE = 2;
    private final String TOAST_MESSAGE = "toast-message";
    private BluetoothSocket bluetoothSocket = null;
    private BluetoothDevice bluetoothDevice = null;

    private LogHandler l;
    private BluetoothSocket x = null;

    public BluetoothService() {
        l = new LogHandler("log-service");
        l.log("Called");
        connectionState = STAND_BY;
    }

    //Return sticky to make the service to restart, when system kills it
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return Service.START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return iBinder;
    }

    @Override
    public boolean onUnbind(Intent intent) {
        return  true;
    }

    @Override
    public void onRebind(Intent intent) {
        super.onRebind(intent);
    }

    public class LocalBinder extends Binder {
        public BluetoothService getService() {
            return BluetoothService.this;
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    public void setHandler(Handler handler) {
        this.handler = handler;
    }

    //Function that start the thread, that manage the connecting methods
    public void connectCommand(BluetoothDevice device) {

        if(connectedThread != null) {
            connectedThread.cancel();
            connectedThread = null;
        }

        connectThread = new ConnectThread(device);
        connectThread.start();

        setState(CONNECTING_STATE);
    }

    //Function that start the thread, that manage the connected methods
    private void connectedToDevice(BluetoothSocket bluetoothSocket, BluetoothDevice bluetoothDevice) {

        sendMessageToUI(TOAST_MESSAGE,"Connected to: " + bluetoothDevice.getName());

        if(bluetoothSocket == null) l.log("S is null 2");
        else l.log("S is not null 2");

        x = bluetoothSocket;

        connectedThread = new BluetoothConnectedThread(bluetoothSocket);
        connectedThread.start();

        setState(CONNECTED_STATE);
    }

    //Function to disconnect the device
    public void stop() {
        if(connectedThread != null) {
            connectedThread.cancel();
            connectedThread = null;
        }

        setState(STAND_BY);
    }

    //Function to change the state value
    private void setState(int state) {
        this.connectionState = state;
        handler.obtainMessage(BluetoothActivity.STATE_CHANGE, state, -1).sendToTarget();
    }

    private void connectionLost() {
        setState(STAND_BY);
        sendMessageToUI(TOAST_MESSAGE, "Connection was lost");
    }

    private void  connectionFailed() {
        setState(STAND_BY);
        sendMessageToUI(TOAST_MESSAGE, "Connection failed");
    }

    //The thread that
    private class ConnectThread extends Thread {

        //UUID used to recongnize the server application
        private UUID uuid = null;
        private BluetoothAdapter bluetoothAdapter;

        public ConnectThread(BluetoothDevice device) {
            BluetoothSocket aux = null;
            bluetoothDevice = device;
            this.bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

            try {
                uuid = UUID.fromString("94bca0f6-ec23-11e7-8c3f-9a214cf093ae");

                //Creating bluetooth socket
                aux = device.createRfcommSocketToServiceRecord(uuid);
            } catch(IOException e) {
                l.log("Failed to create socket: " + e);
            }

            bluetoothSocket = aux;
        }

        public void run() {
            //Stopping finding process if it's running
            bluetoothAdapter.cancelDiscovery();

            try {
                if(bluetoothSocket == null) l.log("S is null");
                else l.log("S is not null");

                //Connecting to device
                bluetoothSocket.connect();
            } catch (IOException e) {
                connectionFailed();
                try {
                    l.log("Closing socket");
                    //Closing the connection
                    bluetoothSocket.close();
                } catch (IOException e2){
                    l.log("Failed to create the client socket: " + e2);
                }

                return;
            }

            synchronized (BluetoothService.this) {
                connectedThread = null;
            }

            //If connection was successfully, start he connected thread
            connectedToDevice(bluetoothSocket, bluetoothDevice);

        }
    }

    //Function used to communicate with activity
    private void sendMessageToUI(String key, String m) {
        Message message = handler.obtainMessage(BluetoothActivity.MESSAGE_TOAST);
        Bundle bundle = new Bundle();
        bundle.putString(key,m);
        message.setData(bundle);
        handler.sendMessage(message);
    }

    public BluetoothSocket getSocket() {
        if(x == null) l.log("Socket is null");
        return bluetoothSocket;
    }
}
