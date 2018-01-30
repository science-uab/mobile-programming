package get.some.tratata.uniprojectcryptotracker.providers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import get.some.tratata.uniprojectcryptotracker.models.Currency;

/**
 * Created by Melentii Evghenii on 1/15/2018.
 * Email: melentii_eugen@mail.ru
 * MIT License
 * Copyright (c) 2018 Melentii Evghenii
 */

public class JsonAdapterProvider {
    private static JsonAdapterProvider instance;

    private JsonAdapterProvider(){

    }

    public static JsonAdapterProvider getInstance(){
        if(instance == null){
            instance = new JsonAdapterProvider();
        }
        return instance;
    }

    public List<Currency> getCurrencyListFromJson(JSONArray jsonArray){
        try {
            List<Currency> list = new ArrayList<>();
            for(int i=0;i<jsonArray.length();i++){
                Currency currency = getCurrencyFromJson(jsonArray.getJSONObject(i));
                if(currency != null) list.add(currency);
            }
            return list;
        } catch (JSONException e) {
            return Collections.emptyList();
        }
    }

    public Currency getCurrencyFromJson(JSONObject jsonObject){
        try {
            return new Currency(jsonObject.getString("currency")
                    ,jsonObject.getDouble("coinmarket")
                    ,jsonObject.getDouble("bitfinex")
                    ,jsonObject.getDouble("bitstamp")
                    ,jsonObject.getDouble("gemini")
                    ,jsonObject.getDouble("hitbtc"));
        } catch (JSONException e) {
            return null;
        }
    }
}
