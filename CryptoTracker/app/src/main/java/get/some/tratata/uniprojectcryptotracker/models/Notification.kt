package get.some.tratata.uniprojectcryptotracker.models

import android.arch.persistence.room.Entity
import android.arch.persistence.room.Index
import android.arch.persistence.room.PrimaryKey

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */
@Entity(tableName = "notification",
        indices = arrayOf(Index(value = arrayOf("id")),Index(value = arrayOf("currencyName"))))
class Notification{
    @PrimaryKey(autoGenerate = true)
    var id:Int = 0
    lateinit var currencyName:String
    lateinit var direction:String
    var goal: Double = 0.0
}