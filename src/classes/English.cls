/**
 * Created by Lena on 22.08.18.
 */

public with sharing class English {
    @AuraEnabled
    public static String getTranslationFromJandex(String wordToTranslate) {
        System.debug(wordToTranslate);
        String stringForReqwest = wordToTranslate.replace(' ', '+');
        System.debug(stringForReqwest);
        //String apiKeyWord = 'trnsl.1.1.20180822T180455Z.8d3e33ae85929bf8.aab00f742d4a3695a59bbc9054229e99faf78855';
        String apiKeyPhrase = 'dict.1.1.20180823T073635Z.d476731fcd416e44.29259a17bf4b8c73d71dafcfbdf13d1224ecca55';
        HttpRequest req = new HttpRequest();
        System.debug(req);
        //req.setEndpoint('http://www.nbrb.by/API/ExRates/Rates/USD?ParamMode=2&onDate='+currentDate);
        req.setEndpoint('https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=' + apiKeyPhrase + '&lang=en-ru&text=' + stringForReqwest);
        req.setMethod('GET');

        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res);
        String myStr = res.getBody();
        System.debug(myStr);

        return myStr;
    }
}