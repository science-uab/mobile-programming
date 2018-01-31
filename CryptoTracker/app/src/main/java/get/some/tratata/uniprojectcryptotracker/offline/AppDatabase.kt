package get.some.tratata.uniprojectcryptotracker.offline

import android.arch.persistence.room.Database
import android.arch.persistence.room.RoomDatabase
import get.some.tratata.uniprojectcryptotracker.models.Notification

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

@Database(entities = arrayOf(Notification::class), version = 1)
abstract class AppDatabase : RoomDatabase() {
    abstract fun notificationDao(): NotificationDao
}