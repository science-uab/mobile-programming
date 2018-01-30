package get.some.tratata.uniprojectcryptotracker.ui

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import get.some.tratata.uniprojectcryptotracker.R

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

class CurrencyActivity: AppCompatActivity(){

    var currentPage : Int = 0
    var currencyName : String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.currency_container)
        if(savedInstanceState != null){
            currentPage = savedInstanceState.getInt("currentPage")
        }
        val fragmentTransaction = supportFragmentManager.beginTransaction()
        when(currentPage){
            0 -> fragmentTransaction.add(R.id.container,CurrencyListFragment())
            1 -> fragmentTransaction.add(R.id.container,CurrencyNotificationsFragment())
        }
        fragmentTransaction.commit()
    }

    override fun onSaveInstanceState(outState: Bundle?) {
        outState?.putInt("currentPage",currentPage)
        super.onSaveInstanceState(outState)
    }

    fun changeFragment(id: Int){
        currentPage = id
        val fragmentTransaction = supportFragmentManager.beginTransaction()
        when(id){
            0 -> fragmentTransaction.replace(R.id.container,CurrencyListFragment())
            1 -> fragmentTransaction.replace(R.id.container,CurrencyNotificationsFragment())
        }
        fragmentTransaction.commit()
    }

    override fun onBackPressed() {
        when(currentPage){
            0 -> super.onBackPressed()
            1 -> changeFragment(0)
        }
    }
}