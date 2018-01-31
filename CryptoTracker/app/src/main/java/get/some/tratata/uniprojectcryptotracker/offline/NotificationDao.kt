package get.some.tratata.uniprojectcryptotracker.offline

import android.arch.persistence.room.Dao
import android.arch.persistence.room.Delete
import android.arch.persistence.room.Insert
import android.arch.persistence.room.Query
import get.some.tratata.uniprojectcryptotracker.models.Notification

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

@Dao
abstract class NotificationDao{

    @Insert
    abstract fun insertNotifications(notifications: List<Notification>)

    @Delete
    abstract fun deleteNotifications(notifications: List<Notification>)

    @Query("SELECT * FROM notification WHERE currencyName = :currencyName")
    abstract fun getNotifications(currencyName: String): List<Notification>

    @Query("SELECT * FROM notification")
    abstract fun getAllNotifications(): List<Notification>
}