/* Dogaru Narcis-George
    narcisgeorge.dogaru@gmail.com
    MIT License
 */

package com.projects.narcis.icontrolit.MyHandlers;

import android.util.Log;

/**
 * Created by Narcis on 1/23/2018.
 */

//A custom class that make easy to log data
public class LogHandler {

    private String tag = "";

    public LogHandler(String tag) {
        this.tag = tag;
    }

    public void log(String text) {
        Log.d(tag, text);
    }

    public void log(int text) {
        Log.d(tag, String.valueOf(text));
    }
}
