package get.some.tratata.uniprojectcryptotracker.services

import com.evernote.android.job.Job
import com.evernote.android.job.JobCreator

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

class AppJobCreator : JobCreator {

    override fun create(tag: String): Job? {
        when (tag) {
            NotificationJob.TAG -> return NotificationJob()
            else -> return null
        }
    }
}