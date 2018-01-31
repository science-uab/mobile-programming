package get.some.tratata.uniprojectcryptotracker.ui

import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v4.widget.SwipeRefreshLayout
import android.support.v7.widget.GridLayoutManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import get.some.tratata.uniprojectcryptotracker.R
import get.some.tratata.uniprojectcryptotracker.providers.JsonAdapterProvider
import kotlinx.android.synthetic.main.currencies_list.*
import kotlinx.android.synthetic.main.currencies_list.view.*
import okhttp3.*
import org.json.JSONArray
import java.io.IOException
import java.util.*

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

class CurrencyListFragment : Fragment(), SwipeRefreshLayout.OnRefreshListener {

    val client = OkHttpClient()
    val adapter = CurrencyListAdapter(Collections.emptyList(), this)

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.currencies_list, container, false)
        view.recyclerView.layoutManager = GridLayoutManager(context, 2, LinearLayout.VERTICAL, false)
        view.recyclerView.adapter = adapter

        view.swipeRefreshLayout.setOnRefreshListener(this)

        view.swipeRefreshLayout.post({
            view.swipeRefreshLayout.isRefreshing = true
            refreshList()
        })

        return view
    }

    override fun onRefresh() {
        refreshList()
    }

    fun refreshList() {
        val url = "http://10.0.2.2:8080/currencies"

        val request = Request.Builder()
                .url(url)
                .build()

        client.newCall(request).enqueue(object : Callback {
            override fun onFailure(call: Call, e: IOException) {}
            override fun onResponse(call: Call, response: Response) {
                adapter.currencies = JsonAdapterProvider.getInstance().getCurrencyListFromJson(JSONArray(response.body()?.string())).also {
                    activity?.runOnUiThread {
                        adapter.notifyDataSetChanged()
                        swipeRefreshLayout.isRefreshing = false
                    }
                }
            }
        })
    }
}
