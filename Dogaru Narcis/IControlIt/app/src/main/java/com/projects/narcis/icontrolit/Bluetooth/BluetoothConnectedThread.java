/* Dogaru Narcis-George
    narcisgeorge.dogaru@gmail.com
    MIT License
 */

package com.projects.narcis.icontrolit.Bluetooth;

import android.bluetooth.BluetoothSocket;

import com.projects.narcis.icontrolit.MyHandlers.LogHandler;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Created by Narcis on 1/22/2018.
 */

//Connected thread that contain the methods that send/get data through bluetooth
public class BluetoothConnectedThread extends Thread {

    private InputStream inputStream;
    private OutputStream outputStream;
    private BluetoothSocket bluetoothSocket;

    private byte[] bufferOut;
    private byte[] bufferIn;
    ByteArrayOutputStream byteArrayOutputStream;
    private int read = 0;
    private final int DEVICE_CONNECTED = 100;
    private final int VOLUME_DATA = 120;

    private LogHandler logHandler;

    public BluetoothConnectedThread(BluetoothSocket bluetoothSocket) {
        InputStream auxInput = null;
        OutputStream auxOutput = null;

        logHandler = new LogHandler("log-thread");

        try {
            //If device is connected, get the connection stream
            if(bluetoothSocket.isConnected()) {
                auxInput = bluetoothSocket.getInputStream();
                auxOutput = bluetoothSocket.getOutputStream();
            }
        } catch (IOException e) {

        }

        inputStream = auxInput;
        outputStream = auxOutput;
    }

    @Override
    public void run() {
        //If connection was successfully send data to bluetooth server
        write(DEVICE_CONNECTED,0);
        bufferIn = new byte[1024];
        byteArrayOutputStream = new ByteArrayOutputStream();
        read = 0;

        try {
            //Listening data to be received
            while (true) {
                //If received something, convert the data from byte array to string
                byteArrayOutputStream = new ByteArrayOutputStream();
                bufferIn = new byte[1024];
                read = inputStream.read(bufferIn,0,bufferIn.length);
            }
        } catch (IOException e) {
            logHandler.log("Device disconnected!");
        }
    }

    //Functions that send data through bluetooth
    public void write(int key, int value) {
        try {
            String serial = String.valueOf(key) + String.valueOf(value);
            bufferOut = serial.getBytes();

            outputStream.write(bufferOut);
        } catch (IOException e) {

        }
    }

    public void write(int key, String value) {
        try {
            String serial = String.valueOf(key) + value;
            bufferOut = serial.getBytes();

            outputStream.write(bufferOut);
        } catch (IOException e) {

        }
    }

    //Function that stop the thread
    public void cancel() {
        try {
            if(bluetoothSocket != null) {
                bluetoothSocket.close();
            }
        } catch (IOException e) {

        }
    }
}
