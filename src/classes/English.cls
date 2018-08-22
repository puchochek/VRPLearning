/**
 * Created by Lena on 22.08.18.
 */

public with sharing class English {
    @AuraEnabled
    public static String getTranslationFromJandex(String wordToTranslate) {
        System.debug(wordToTranslate);
        String apiKey = 'trnsl.1.1.20180822T180455Z.8d3e33ae85929bf8.aab00f742d4a3695a59bbc9054229e99faf78855';
        HttpRequest req = new HttpRequest();
        //req.setEndpoint('http://www.nbrb.by/API/ExRates/Rates/USD?ParamMode=2&onDate='+currentDate);
        req.setEndpoint('https://translate.yandex.net/api/v1.5/tr.json/translate?lang=en-ru&key=' + apiKey + '&text=' + wordToTranslate);
        req.setMethod('GET');

        Http http = new Http();
        HTTPResponse res = http.send(req);
        String myStr = res.getBody();
        System.debug(myStr);

        return myStr;
    }
}