package get.some.tratata.uniprojectcryptotracker.providers;

import android.arch.persistence.room.Room;
import android.content.Context;

import java.util.List;
import java.util.concurrent.Callable;

import get.some.tratata.uniprojectcryptotracker.models.Notification;
import get.some.tratata.uniprojectcryptotracker.offline.AppDatabase;
import io.reactivex.Observable;

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

public class OfflineProvider {
    private static OfflineProvider instance;
    private static AppDatabase databaseInstance;

    private OfflineProvider(Context context) {
        if (databaseInstance == null) {
            databaseInstance = Room.databaseBuilder(context,
                    AppDatabase.class, "AppDatabase")
                    .build();
        }
    }

    public static OfflineProvider getInstance(Context context) {
        if (instance == null) {
            instance = new OfflineProvider(context);
        }
        return instance;
    }


    public Observable<Boolean> insertNotifications(final List<Notification> notifications) {
        return Observable.fromCallable(new Callable<Boolean>() {
            @Override
            public Boolean call() throws Exception {
                databaseInstance.notificationDao().insertNotifications(notifications);
                return true;
            }
        });
    }

    public Observable<Boolean> deleteNotifications(final List<Notification> notifications) {
        return Observable.fromCallable(new Callable<Boolean>() {
            @Override
            public Boolean call() throws Exception {
                databaseInstance.notificationDao().deleteNotifications(notifications);
                return true;
            }
        });
    }

    public Observable<List<Notification>> getNotifications(final String currencyName) {
        return Observable.fromCallable(new Callable<List<Notification>>() {
            @Override
            public List<Notification> call() throws Exception {
                return databaseInstance.notificationDao().getNotifications(currencyName);
            }
        });
    }

    public Observable<List<Notification>> getAllNotifications() {
        return Observable.fromCallable(new Callable<List<Notification>>() {
            @Override
            public List<Notification> call() throws Exception {
                return databaseInstance.notificationDao().getAllNotifications();
            }
        });
    }
}
