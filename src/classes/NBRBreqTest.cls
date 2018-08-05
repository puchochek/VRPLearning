/**
 * Created by Lena on 05.08.18.
 */
@isTest
private class NBRBreqTest {
        @isTest static void testCallout() {
            Test.setMock(HttpCalloutMock.class, new NBRBcurTest());

            String res = NBRBcur.getCurrencey('2018-08-01');

            // Verify response received contains fake values
            //String contentType = res.getHeader('Content-Type');
            //System.assert(contentType == 'application/json');
            String actualValue = res;
            String expectedValue = '[{"Cur_ID":170,"Date":"2018-08-05T00:00:00","Cur_Abbreviation":"AUD","Cur_Scale":1,"Cur_Name":"Австралийский доллар","Cur_OfficialRate":1.4822},{"Cur_ID":191,"Date":"2018-08-05T00:00:00","Cur_Abbreviation":"BGN","Cur_Scale":1,"Cur_Name":"Болгарский лев","Cur_OfficialRate":1.1918}]';
            //System.assertEquals(actualValue, expectedValue);
            //System.assertEquals(200, res.getStatusCode());
        }

}