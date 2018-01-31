package get.some.tratata.uniprojectcryptotracker

import android.app.Application
import get.some.tratata.uniprojectcryptotracker.services.NotificationJob

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

public class App : Application() {

    override fun onCreate() {
        super.onCreate()
        NotificationJob.scheduleJob()
    }
}