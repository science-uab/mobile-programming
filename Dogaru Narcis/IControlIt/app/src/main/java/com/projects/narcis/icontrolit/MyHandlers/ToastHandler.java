/* Dogaru Narcis-George
    narcisgeorge.dogaru@gmail.com
    MIT License
 */

package com.projects.narcis.icontrolit.MyHandlers;

import android.content.Context;
import android.widget.Toast;

/**
 * Created by Narcis on 1/21/2018.
 */


//A custom class that make easy to show toast messages
public class ToastHandler {

    private Context context;

    public ToastHandler(Context context) {
        this.context = context;
    }

    public void showToast(String text) {
        Toast.makeText(context, text, Toast.LENGTH_LONG).show();
    }
}
