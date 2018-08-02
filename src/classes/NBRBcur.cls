/**
 * Created by Lena on 02.08.18.
 */

public with sharing class NBRBcur {
    @AuraEnabled
    public static String getCurrencey(String currentDate){
        System.debug(currentDate);

        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://www.nbrb.by/API/ExRates/Rates/USD?ParamMode=2&onDate='+currentDate);
        req.setMethod('GET');

        Http http = new Http();
        HTTPResponse res = http.send(req);
        //System.debug(res.getBody());

        String myStr = res.getBody();
        System.debug(myStr);
        return myStr;
    }
}