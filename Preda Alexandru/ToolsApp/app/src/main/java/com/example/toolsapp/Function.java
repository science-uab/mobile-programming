/**
 * Author: Preda Alexandru
 Email: alexpreda95@yahoo.com
 Copyright (c) [2018] [Preda Alexandru]
 */

package com.example.toolsapp;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.support.v4.app.ActivityCompat;
/**
 * Created by Alex on 29.01.2018.
 */

public class Function {
    public static  boolean hasPermissions(Context context, String... permissions) {
        if (android.os.Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && context != null && permissions != null) {
            for (String permission : permissions) {
                if (ActivityCompat.checkSelfPermission(context, permission) != PackageManager.PERMISSION_GRANTED) {
                    return false;
                }
            }
        }
        return true;
    }
}
