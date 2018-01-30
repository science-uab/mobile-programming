/* Dogaru Narcis-George
    narcisgeorge.dogaru@gmail.com
    MIT License
 */

package com.projects.narcis.icontrolit.Bluetooth;

import android.app.ProgressDialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.graphics.Color;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.projects.narcis.icontrolit.MyHandlers.ToastHandler;
import com.projects.narcis.icontrolit.R;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import static com.projects.narcis.icontrolit.MainActivity.bluetoothAdapter;
import static com.projects.narcis.icontrolit.MainActivity.connectState;

//Bluetooth Page activity
public class BluetoothActivity extends AppCompatActivity {

    private Button bluetoothToggle;
    private ListView listView;
    private ProgressDialog progressDialog;
    private ArrayList<BluetoothDevice> nearbyDevices;
    private PairedDevicesAdapter pairedDevicesAdapter;
    private ImageView buttonBack, buttonAddNewDevs;
    protected static int itemPosition = -1;
    private String currentDevAddress = "";
    private boolean scan = false;
    public static final int MESSAGE_TOAST = 1;
    public static final int STATE_CHANGE = 2;
    private String currentDeviceName = "";
    private String currentDeviceAddress = "";
    private BluetoothService bluetoothService;
    private Handler handler;
    private Context context;

    private ToastHandler toastHandler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bluetooth);

        bluetoothToggle = (Button)findViewById(R.id.buttonToggle);
        listView = (ListView)findViewById(R.id.pairedDevices);
        buttonBack = (ImageView)findViewById(R.id.buttonBack);
        buttonAddNewDevs = (ImageView)findViewById(R.id.buttonScan);
        pairedDevicesAdapter = new PairedDevicesAdapter(this);

        context = BluetoothActivity.this;
        toastHandler = new ToastHandler(context);

        //Binding the current activity to service, to be able to comunicate with it and exchange data
        Intent serviceIntent = new Intent(BluetoothActivity.this, BluetoothService.class);
        bindService(serviceIntent, serviceConnection, Context.BIND_AUTO_CREATE);

        //Creating handler to manage communications between service and activity
        handler = new Handler() {
            @Override
            public void handleMessage(Message message) {
                switch (message.what) {
                    case MESSAGE_TOAST:
                        toastHandler.showToast(message.getData().getString("toast-message"));
                        break;
                    case STATE_CHANGE:
                        switch (message.arg1) {
                            case BluetoothService.CONNECTED_STATE:
                                connectState = true;

                                pairedDevicesAdapter.setItem(itemPosition, true);
                                break;

                            case BluetoothService.STAND_BY:
                                connectState = false;

                                currentDeviceName = "";
                                currentDeviceAddress = "";

                                pairedDevicesAdapter.setItem(itemPosition, false);
                                itemPosition = -1;


                                toastHandler.showToast("Disconnected");
                                break;
                        }
                        break;
                }
            }
        };

        //Creating progress dialog, used to show the scanning progress or to abord it
        progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Searcing for nearby devices ...");
        progressDialog.setCancelable(false);
        progressDialog.setButton(DialogInterface.BUTTON_NEGATIVE, "Cancel", new DialogInterface.OnClickListener(){
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
                bluetoothAdapter.cancelDiscovery();
            }
        });

        /*Creating an intentFilter used for register a broacast receiver, making application to listen to system-level messages,
        and respond to them.*/
        IntentFilter intentFilter = new IntentFilter();

        intentFilter.addAction(BluetoothAdapter.ACTION_STATE_CHANGED);
        intentFilter.addAction(BluetoothDevice.ACTION_FOUND);
        intentFilter.addAction(BluetoothAdapter.ACTION_DISCOVERY_STARTED);
        intentFilter.addAction(BluetoothAdapter.ACTION_DISCOVERY_FINISHED);
        registerReceiver(broadcastReceiver, intentFilter);

        buttonBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        buttonAddNewDevs.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(bluetoothAdapter.isEnabled()) {
                    scan = true;
                    bluetoothAdapter.startDiscovery();
                } else {
                    toastHandler.showToast("Bluetooth is turned OFF!");
                }
            }
        });

        //If bluetooth is enabled, all paired devices will be listed
        if(bluetoothAdapter.isEnabled()) {
            bluetoothToggle.setText("ON");
            bluetoothToggle.setBackgroundColor(Color.GREEN);

            populateListView();
        }

        bluetoothToggle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!bluetoothAdapter.isEnabled()) {
                    //Sending a request to system to enable the bluetooth adapter
                    Intent intent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
                    startActivityForResult(intent, 1000);
                    bluetoothToggle.setText("ON");
                    bluetoothToggle.setBackgroundColor(Color.GREEN);

                    populateListView();
                } else {
                    //Disable bluetooth adapter
                    bluetoothAdapter.disable();
                    bluetoothToggle.setText("OFF");
                    bluetoothToggle.setBackgroundColor(Color.RED);

                    listView.setAdapter(null);
                }
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();

        if(bluetoothAdapter.isEnabled()) {
            bluetoothToggle.setText("ON");
            bluetoothToggle.setBackgroundColor(Color.GREEN);

            populateListView();
        } else {
            bluetoothToggle.setText("OFF");
            bluetoothToggle.setBackgroundColor(Color.RED);
            listView.setAdapter(null);
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(broadcastReceiver);
    }

    //Creating the BroadcastReceiver object
    private final BroadcastReceiver broadcastReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();

            switch(action) {
                //Event when bluetooth adapter state has changed
                case BluetoothAdapter.ACTION_STATE_CHANGED:
                    final int state = intent.getIntExtra(BluetoothAdapter.EXTRA_STATE, BluetoothAdapter.ERROR);
                    if(state == BluetoothAdapter.STATE_ON) {
                        toastHandler.showToast("Bluetooth enabled");
                    }
                    break;
                //Event when finding devies process started
                case BluetoothAdapter.ACTION_DISCOVERY_STARTED:
                    nearbyDevices = new ArrayList<>();
                    progressDialog.show();
                    break;
                //Event when finding devices process stopped
                case BluetoothAdapter.ACTION_DISCOVERY_FINISHED:
                    progressDialog.dismiss();
                    if(scan == true) {
                        Intent intent1 = new Intent(BluetoothActivity.this, BluetoothDevicesActivity.class);
                        intent1.putParcelableArrayListExtra("devices.list", nearbyDevices);
                        scan = false;
                        startActivity(intent1);
                    }
                    break;
                //Event when adapter found a bluetooth device
                case BluetoothDevice.ACTION_FOUND:
                    BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                    nearbyDevices.add(device);
                    break;

                default:
            }
        }
    };

    private void populateListView() {
            //Getting paired devices
            Set<BluetoothDevice> pairedDevices = bluetoothAdapter.getBondedDevices();
            final List<BluetoothDevice> devices = new ArrayList<>();

            for (BluetoothDevice bd : pairedDevices) {
                devices.add(bd);
            }

            //Add pairedDevices to adapter
            pairedDevicesAdapter.setData(devices);
            //Creating listener for every list item
            pairedDevicesAdapter.setListener(new PairedDevicesAdapter.OnConnectClick() {
                @Override
                public void onConnectClick(int position) {
                    BluetoothDevice device = devices.get(position);

                    if (connectState == false) {
                        toastHandler.showToast("Connecting to: " + device.getName());

                        currentDeviceName = device.getName();
                        currentDeviceAddress = device.getAddress();
                        itemPosition = position;
                        bluetoothService.connectCommand(device);

                    } else {
                        bluetoothService.stop();
                    }
                }
            });

            //Populating list view
            listView.setAdapter(pairedDevicesAdapter);
    }

    //Creating the service connection to be able to bound activity to service
    public ServiceConnection serviceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            BluetoothService.LocalBinder localBinder = (BluetoothService.LocalBinder)service;
            bluetoothService = localBinder.getService();
            bluetoothService.setHandler(handler);
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {

        }
    };

    //Creating an adapter, used for creating a custom list view. Every item has a textview and an image view used as button
    private static class PairedDevicesAdapter extends BaseAdapter {

        private LayoutInflater layoutInflater;
        private List<BluetoothDevice> devices;
        private OnConnectClick connectClick;
        private List<ImageView> buttons;

        public PairedDevicesAdapter(Context context) {
            layoutInflater = LayoutInflater.from(context);
            buttons = new ArrayList<>();
        }

        //Getting list that contain items, that will populate the listview
        public void setData(List<BluetoothDevice> data) {
            devices = data;
        }

        //Setting listener for every item on listview
        public void setListener(OnConnectClick connectClick) {
            this.connectClick = connectClick;
        }

        public int getCount() {
            return (devices == null) ? 0 : devices.size();
        }

        public Object getItem(int position) {
            return devices.get(position);
        }

        public long getItemId(int position) {
            return position;
        }

        public View getView(final int position, View convertView, ViewGroup parent) {
            ViewRow row;

            if(convertView == null) {
                convertView = layoutInflater.inflate(R.layout.paired_devices, null);

                row = new ViewRow();

                row.deviceName = (TextView) convertView.findViewById(R.id.pairedDeviceName);
                row.deviceAddress = (TextView) convertView.findViewById(R.id.pairedDeviceAddress);
                row.buttonConnect = (ImageView) convertView.findViewById(R.id.buttonConnect);

                convertView.setTag(row);
            } else {
                row = (ViewRow)convertView.getTag();
            }

            BluetoothDevice device = devices.get(position);

            buttons.add(row.buttonConnect);
            connectState = (itemPosition == position) ? true : false;
            row.buttonConnect.setImageResource((itemPosition == position) ? R.mipmap.bl_connected : R.mipmap.bl_connect);
            row.deviceName.setText(device.getName());
            row.deviceAddress.setText(device.getAddress());

            row.buttonConnect.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if(connectClick != null) {
                        itemPosition = position;
                        connectClick.onConnectClick(position);
                    }
                }
            });

            return convertView;
        }

        class ViewRow {
            TextView deviceName;
            TextView deviceAddress;
            ImageView buttonConnect;
        }

        public interface OnConnectClick {
            public abstract void onConnectClick(int position);
        }

        public void setItem(int position, boolean connected) {
            ImageView button = buttons.get(position);

            button.setImageResource((connected == false) ? R.mipmap.bl_connect : R.mipmap.bl_connected);
        }
    }
}
