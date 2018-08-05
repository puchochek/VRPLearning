/**
 * Created by Lena on 05.08.18.
 */
@isTest
global class NBRBcurTest implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        System.assertEquals('GET', req.getMethod());

        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('[{"Cur_ID":170,"Date":"2018-08-05T00:00:00","Cur_Abbreviation":"AUD","Cur_Scale":1,"Cur_Name":"Австралийский доллар","Cur_OfficialRate":1.4822},{"Cur_ID":191,"Date":"2018-08-05T00:00:00","Cur_Abbreviation":"BGN","Cur_Scale":1,"Cur_Name":"Болгарский лев","Cur_OfficialRate":1.1918}]');
        res.setStatusCode(200);
        return res;
    }

}