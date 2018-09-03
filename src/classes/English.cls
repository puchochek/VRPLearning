public with sharing class English {
   
    @AuraEnabled
    public static String getTranslationPhrase(String wordToTranslate) {

        String stringForReqwest = wordToTranslate.replace(' ', '+');
        String apiKeyWord = 'trnsl.1.1.20180822T180455Z.8d3e33ae85929bf8.aab00f742d4a3695a59bbc9054229e99faf78855';
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://translate.yandex.net/api/v1.5/tr.json/translate?key=' + apiKeyWord + '&lang=en-ru&text=' + stringForReqwest);
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        String myStr = res.getBody();
        return myStr;
    }

    @AuraEnabled
    public static String getTranslationWord(String wordToTranslate) {
        HttpRequest req = new HttpRequest();
        String apiKeyPhrase = 'dict.1.1.20180823T073635Z.d476731fcd416e44.29259a17bf4b8c73d71dafcfbdf13d1224ecca55';
        req.setEndpoint('https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=' + apiKeyPhrase + '&lang=en-ru&text=' + wordToTranslate);
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        String myStr = res.getBody();
        return myStr;
    }

    @AuraEnabled
    public static String saveTranslation(String translation) {
        System.debug('im here');
        System.debug(translation);
        return translation;

    }
}