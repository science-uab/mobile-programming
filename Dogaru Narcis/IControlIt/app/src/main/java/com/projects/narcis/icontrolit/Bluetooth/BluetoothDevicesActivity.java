/* Dogaru Narcis-George
    narcisgeorge.dogaru@gmail.com
    MIT License
 */

package com.projects.narcis.icontrolit.Bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.projects.narcis.icontrolit.MyHandlers.ToastHandler;
import com.projects.narcis.icontrolit.R;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static android.R.id.list;

//Nearby bluetooth devices activity
public class BluetoothDevicesActivity extends AppCompatActivity {

    private ImageView buttonBack;
    private ListView listView;
    private ArrayList<BluetoothDevice> devices;
    private NearbyDevicesAdapter nearbyDevicesAdapter;
    private ToastHandler toastHandler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bluetooth_devices);

        toastHandler = new ToastHandler(BluetoothDevicesActivity.this);

        buttonBack = (ImageView)findViewById(R.id.buttonBack2);
        listView = (ListView)findViewById(R.id.newDevices);
        nearbyDevicesAdapter = new NearbyDevicesAdapter(this);
        devices = getIntent().getExtras().getParcelableArrayList("devices.list");

        buttonBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        nearbyDevicesAdapter.setData(devices);
        nearbyDevicesAdapter.setListener(new NearbyDevicesAdapter.OnPairButtonClick() {
            @Override
            public void onPairButtonClick(int position) {
                BluetoothDevice device = devices.get(position);

                if(device.getBondState() == BluetoothDevice.BOND_BONDED) {
                    unpairDevice(device);
                } else {
                    toastHandler.showToast("Pairing ...");
                    pairDevice(device);
                }
            }
        });

        listView.setAdapter(nearbyDevicesAdapter);

        registerReceiver(broadcastReceiver, new IntentFilter(BluetoothDevice.ACTION_BOND_STATE_CHANGED));
    }

    public void onDestroy() {
        super.onDestroy();
        unregisterReceiver(broadcastReceiver);
    }

    //Function to pair selected device
    private void pairDevice(BluetoothDevice device) {
        try {
            Method method = device.getClass().getMethod("createBond", (Class[]) null);
            method.invoke(device, (Object[]) null);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Function to unpair selected device
    private void unpairDevice(BluetoothDevice device) {
        try {
            Method method = device.getClass().getMethod("removeBond", (Class[]) null);
            method.invoke(device, (Object[]) null);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private final BroadcastReceiver broadcastReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            //Event when bluetooth adapter state has changed
            if (BluetoothDevice.ACTION_BOND_STATE_CHANGED.equals(action)) {
                final int state 		= intent.getIntExtra(BluetoothDevice.EXTRA_BOND_STATE, BluetoothDevice.ERROR);
                final int prevState	= intent.getIntExtra(BluetoothDevice.EXTRA_PREVIOUS_BOND_STATE, BluetoothDevice.ERROR);

                if (state == BluetoothDevice.BOND_BONDED && prevState == BluetoothDevice.BOND_BONDING) {
                    toastHandler.showToast("Paired");
                } else if (state == BluetoothDevice.BOND_NONE && prevState == BluetoothDevice.BOND_BONDED){
                    toastHandler.showToast("Unpaired");
                }

                nearbyDevicesAdapter.notifyDataSetChanged();
            }
        }
    };

    //Creating an adapter, used for creating a custom list view. Every item has a textview and an image view used as button.
    private static class NearbyDevicesAdapter extends BaseAdapter {
        private LayoutInflater layoutInflater;
        private List<BluetoothDevice> devices;
        private OnPairButtonClick buttonClick;

        public NearbyDevicesAdapter(Context context) {
            layoutInflater = LayoutInflater.from(context);
        }

        //Getting list that contain items, that will populate the listview
        public void setData(List<BluetoothDevice> data) {
            devices = data;
        }

        //Setting listener for every item on listview
        public void setListener(OnPairButtonClick buttonClick) {
            this.buttonClick = buttonClick;
        }

        public int getCount() {
            return (devices == null) ? 0 : devices.size();
        }

        public Objects getItem(int position) {
            return null;
        }

        public long getItemId(int position) {
            return position;
        }

        public View getView(final int position, View convertView, ViewGroup parent) {
            ViewRow row;

            if(convertView == null) {
                convertView = layoutInflater.inflate(R.layout.nearby_devices, null);

                row = new ViewRow();

                row.deviceName = (TextView)convertView.findViewById(R.id.deviceName);
                row.deviceAddress = (TextView)convertView.findViewById(R.id.deviceAddress);
                row.buttonPair = (ImageView)convertView.findViewById(R.id.buttonPair);

                convertView.setTag(row);
            } else {
                row = (ViewRow)convertView.getTag();
            }

            BluetoothDevice device = devices.get(position);

            row.deviceName.setText(device.getName());
            row.deviceAddress.setText(device.getAddress());
            row.buttonPair.setImageResource((device.getBondState() == BluetoothDevice.BOND_BONDED) ? R.mipmap.remove_c : R.mipmap.add_c);
            row.buttonPair.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if(buttonClick != null) {
                        buttonClick.onPairButtonClick(position);
                    }
                }
            });

            return convertView;
        }

        static class ViewRow {
            TextView deviceName;
            TextView deviceAddress;
            ImageView buttonPair;
        }

        public interface OnPairButtonClick {
            public abstract void onPairButtonClick(int position);
        }
    }
}
