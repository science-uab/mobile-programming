package get.some.tratata.uniprojectcryptotracker.ui

import android.content.res.ColorStateList
import android.graphics.Color
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import get.some.tratata.uniprojectcryptotracker.R
import get.some.tratata.uniprojectcryptotracker.models.Currency
import kotlinx.android.synthetic.main.currencies_list_item.view.*

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

class CurrencyListAdapter(var currencies: List<Currency>, val fragment: CurrencyListFragment) : RecyclerView.Adapter<CurrencyListAdapter.ViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup?, viewType: Int): ViewHolder {
        val v = LayoutInflater.from(parent?.context).inflate(R.layout.currencies_list_item, parent, false)
        return ViewHolder(v)
    }

    override fun getItemCount(): Int {
        return currencies.size
    }

    override fun onBindViewHolder(holder: ViewHolder?, position: Int) {
        holder?.bindItems(currencies[position])
    }


    inner class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        fun bindItems(currency: Currency) {
            when (currency.name.toLowerCase()) {
                "btc" -> itemView.constraintLayout.backgroundTintList = ColorStateList.valueOf(Color.YELLOW)
                "eth" -> itemView.constraintLayout.backgroundTintList = ColorStateList.valueOf(Color.GREEN)
            }
            itemView.name.text = currency.name.toUpperCase()
            itemView.coinmarket.text = currency.coinmarket.toString()
            itemView.bitfinex.text = currency.bitfinex.toString()
            itemView.bitstamp.text = currency.bitstamp.toString()
            itemView.gemini.text = currency.gemini.toString()
            itemView.hitbtc.text = currency.hitbtc.toString()

            itemView.setOnClickListener {
                fragment.activity.apply {
                    if (this is CurrencyActivity) {
                        this.currencyName = currency.name
                        this.changeFragment(1)
                    }
                }
            }
        }

    }
}