package get.some.tratata.uniprojectcryptotracker.ui

import android.os.Bundle
import android.support.v4.app.Fragment
import android.text.InputType
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.ViewManager
import android.widget.*
import get.some.tratata.uniprojectcryptotracker.R
import get.some.tratata.uniprojectcryptotracker.models.Notification
import get.some.tratata.uniprojectcryptotracker.providers.OfflineProvider
import get.some.tratata.uniprojectcryptotracker.util.Util
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import kotlinx.android.synthetic.main.currency_notifications.*
import kotlinx.android.synthetic.main.currency_notifications.view.*
import java.util.ArrayList

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

//Programmatically managed views life
class CurrencyNotificationsFragment : Fragment(), View.OnClickListener {

    internal var editTextIds = ArrayList<Int>()
    internal var switchIds = ArrayList<Int>()
    internal var buttonIds = ArrayList<Int>()
    internal var itemIds = ArrayList<Int>()
    var currencyName = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        retainInstance = true
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.currency_notifications, container, false)
        currencyName = (activity as CurrencyActivity).currencyName

        view.add_notification.setOnClickListener { addNotification(null) }

        OfflineProvider.getInstance(context).getNotifications(currencyName).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe {
            for(notification in it){
                addNotification(notification)
            }
            OfflineProvider.getInstance(context).deleteNotifications(it).subscribeOn(Schedulers.io()).subscribe()
        }
        return view
    }

    override fun onDestroyView() {
        editTextIds.clear()
        switchIds.clear()
        buttonIds.clear()
        itemIds.clear()
        super.onDestroyView()
    }

    override fun onPause() {
        saveNotification()
        super.onPause()
    }

    override fun onDestroy() {
        saveNotification()
        super.onDestroy()
    }


    private fun addNotification(notification: Notification?) {
        val item = layoutInflater.inflate(R.layout.notification_item, notifications_container, false)
        item.id = Util.generateViewId()
        val textView = item.findViewById<TextView>(R.id.textView)
        val switchView = item.findViewById<Switch>(R.id.switchView)
        val editText = item.findViewById(R.id.edittextitem) as EditText
        val imageButton = item.findViewById(R.id.imageButton) as ImageButton
        textView.text = currencyName + " (smaller "
        switchView.id = Util.generateViewId()
        editText.id = Util.generateViewId()
        editText.hint = "goal value"
        editText.inputType = InputType.TYPE_CLASS_NUMBER or InputType.TYPE_NUMBER_FLAG_DECIMAL
        imageButton.id = Util.generateViewId()
        imageButton.setOnClickListener(this)
        editTextIds.add(editText.id)
        switchIds.add(switchView.id)
        buttonIds.add(imageButton.id)
        itemIds.add(item.id)
        notifications_container.addView(item)
        if(notification != null){
            if(notification.direction.equals("up")) switchView.isChecked = true
            editText.setText(notification.goal.toString())
        }
    }

    override fun onClick(v: View) {
        for (i in buttonIds.indices) {
            if (v.id == buttonIds[i]) {
                val linearLayout = view?.findViewById<View>(itemIds[i]) as LinearLayout
                (linearLayout.parent as ViewManager).removeView(linearLayout)
                buttonIds.removeAt(i)
                switchIds.removeAt(i)
                editTextIds.removeAt(i)
                itemIds.removeAt(i)
                break
            }
        }
    }

    fun saveNotification(){
        val notifications = ArrayList<Notification>()
        var notification: Notification
        for(i in editTextIds.indices){
            notification = Notification()
            notification.currencyName = currencyName
            val et = view?.findViewById<View>(editTextIds[i]) as EditText
            val switchView = view?.findViewById<View>(switchIds[i]) as Switch
            if(switchView.isChecked) notification.direction = "up"
            else notification.direction = "down"
            val tt = et.text.toString()
            if(tt.isBlank()) continue
                else notification.goal = tt.toDouble()
            notifications.add(notification)
        }
        OfflineProvider.getInstance(context).insertNotifications(notifications).subscribeOn(Schedulers.io()).subscribe()
    }

}