package get.some.tratata.uniprojectcryptotracker.services

import android.app.Notification
import android.support.v4.app.NotificationCompat
import android.support.v4.app.NotificationManagerCompat
import com.evernote.android.job.Job
import com.evernote.android.job.JobRequest
import get.some.tratata.uniprojectcryptotracker.providers.OfflineProvider
import get.some.tratata.uniprojectcryptotracker.util.Util
import okhttp3.*
import org.json.JSONObject
import java.io.IOException
import java.util.concurrent.TimeUnit

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

class NotificationJob : Job() {

    override fun onRunJob(params: Job.Params): Job.Result {
        val notifications = OfflineProvider.getInstance(context).allNotifications.blockingFirst()
        for (notification in notifications) {
            val client = OkHttpClient()
            val url = "http://10.0.2.2:8080/currencies/check?c=" +
                    notification.currencyName + "&d=" +
                    notification.direction + "&v=" +
                    notification.goal

            val request = Request.Builder()
                    .url(url)
                    .build()

            client.newCall(request).enqueue(object : Callback {
                override fun onFailure(call: Call, e: IOException) {}
                override fun onResponse(call: Call, response: Response) {
                    JSONObject(response.body()?.string()).also {
                        if (it.getBoolean("reached")) {
                            raiseNotification("WAKE UP!!! " +
                                    notification.currencyName.toUpperCase() +
                                    " has reached " +
                                    it.getJSONObject("currency").getString("coinmarket"))
                        }
                    }
                }
            })
        }
        return Result.RESCHEDULE
    }


    private fun raiseNotification(message: String) {
        val notificationBuilder = NotificationCompat.Builder(context, TAG)
                .setDefaults(Notification.DEFAULT_ALL)
                .setContentTitle(message)
                .setChannelId(TAG)
                .setSmallIcon(android.R.drawable.alert_light_frame)
                .setShowWhen(true)
                .setLocalOnly(false)

        NotificationManagerCompat.from(context).notify(Util.generateViewId(), notificationBuilder.build())
    }

    companion object {
        val TAG = "notification_job"

        fun scheduleJob() {
            JobRequest.Builder(TAG)
                    .setPeriodic(TimeUnit.MINUTES.toMillis(15), TimeUnit.MINUTES.toMillis(5))
                    .setRequiredNetworkType(JobRequest.NetworkType.CONNECTED)
                    .setUpdateCurrent(false)
                    .setRequirementsEnforced(true)
                    .build()
                    .schedule()
        }
    }
}