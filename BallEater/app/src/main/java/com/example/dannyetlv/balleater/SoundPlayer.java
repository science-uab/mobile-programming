/*
Tomuta Dan-Claudiu
dan_tomuta@yahoo.com

+MIT License
 +
 +Copyright (c) 2018 danclaudiu95
 +
 +Permission is hereby granted, free of charge, to any person obtaining a copy
 +of this software and associated documentation files (the "Software"), to deal
 +in the Software without restriction, including without limitation the rights
 +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 +copies of the Software, and to permit persons to whom the Software is
 +furnished to do so, subject to the following conditions:
 */

package com.example.dannyetlv.balleater;

import android.content.Context;
import android.media.AudioManager;
import android.media.SoundPool;

/**
 * Created by dannyetlv on 30.01.2018.
 */

public class SoundPlayer {
    private static SoundPool soundPool;
    private static int hitSound;
    private static int overSound;

    public SoundPlayer(Context context){
        //SoundPool (int maxStreams, int streamType, int srcQuality)
        soundPool = new SoundPool(2, AudioManager.STREAM_MUSIC,0);
        hitSound = soundPool.load(context, R.raw.hit, 1);
        overSound = soundPool.load(context, R.raw.over,1);

    }

    public void playHitSound(){
        soundPool.play(hitSound, 1.1f, 1.1f,1,0,1.0f);
    }
    public void playOverSound(){
        soundPool.play(overSound, 1.1f, 1.1f,1,0,1.0f);
    }
}
