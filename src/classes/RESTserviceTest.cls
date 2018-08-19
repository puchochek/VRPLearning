/**
 * Created by User on 15.08.2018.
 */
@isTest
public class RESTserviceTest {

    @testSetup
    static void setup(){
        createGuests();
    }

    private static void createGuests(){
        List<Guest__c> guestsForTest = new List<Guest__c>();
        List<Contact> contactsForTest = new List<Contact>();
        for (Integer i = 0; i < 5; i++) {
            guestsForTest.add(new Guest__c(Is_Invited__c = false));
            guestsForTest.add(new Guest__c(Is_Invited__c = true));
            contactsForTest.add(new Contact(LastName = 'A' + i));
            contactsForTest.add(new Contact(LastName = 'A' + 1));

        }
        insert contactsForTest;
        insert guestsForTest;

    }

    @isTest
    public static void testGEtApiAll(){
        List<Guest__c> listForTestAll = [
                SELECT Name
                FROM Guest__c];

        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/test/';
        req.httpMethod = 'GET';

        RestContext.request = req;
        RestContext.response= res;

        //System.debug(req);
        //System.debug(listForTestAll);

        System.assertEquals('All the guests are ' + listForTestAll, RESTservice.getContacts());

    }
    @isTest
    public static void testGEtApiOne() {
        List<Guest__c> listForTestAll = [
                SELECT Name
                FROM Guest__c];

        String param = listForTestAll[0].Name;

        List<Guest__c> listForTestOne = new List<Guest__c>();
        listForTestOne.add(listForTestAll[0]);

        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/test/' + param;
        req.httpMethod = 'GET';

        RestContext.request = req;
        RestContext.response= res;

        System.assertEquals('The contact is found ' + listForTestOne, RESTservice.getContacts());
    }

    @isTest
    public static void testGetUninvitedGuestPositive() {
        Boolean param = false;
        List<Guest__c> listForTestFalse = [
                SELECT Name
                FROM Guest__c
                WHERE Is_Invited__c = :param
        ];
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/test/' + param;
        req.httpMethod = 'GET';

        RestContext.request = req;
        RestContext.response= res;

        System.assertEquals('There are uninvited guests ' + listForTestFalse, RESTservice.getContacts());

    }
    @isTest
    public static void testGetUninvitedGuestNegative() {
        Boolean param = true;

        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/test/' + param;
        req.httpMethod = 'GET';

        RestContext.request = req;
        RestContext.response= res;

        System.assertEquals('Please, check the input.', RESTservice.getContacts());
    }
    @isTest
    public static void testPutInsertGuestById(){
        List<Contact> existedContacts = [
                SELECT Name
                FROM Contact
        ];
        String param = existedContacts[0].Id;
        List<String> paramList = new List<String>();
        paramList.add(param);

        List<Guest__c> createdGuests = new List<Guest__c>();
        Guest__c createdGuest = new Guest__c(Is_Invited__c = true, Contact__c = paramList[0]);
        createdGuests.add(createdGuest);

        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/test/';
        req.httpMethod = 'GET';

        RestContext.request = req;
        RestContext.response= res;

        String resp = RESTservice.inviteGuestByName(paramList);
        List<Guest__c> createdTestGuest = [
                SELECT Is_Invited__c, Contact__c
                FROM Guest__c
                WHERE Contact__c = :param
        ];
        System.assertEquals('This guest ' + createdTestGuest +  ' is invited', resp);
    }

    @isTest
    public static void testPutInsertDuplicateGuestByName(){
        List<Contact> existedContacts = [
                SELECT Name
                FROM Contact
        ];
        List<String> paramList = new List<String>();
        paramList.add(existedContacts[0].Name);
        paramList.add(existedContacts[1].Name);
        paramList.add(existedContacts[2].Name);
        Set<String> duplicate = new Set<String>();
        duplicate.add(paramList[1]);

        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/test/';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response= res;

        List<Contact> relatedContacts = [
                SELECT Name, Id
                FROM Contact
                WHERE Name IN : paramList
        ];
        System.assertEquals('This contacts ' + duplicate + ' have duplicate values. Please, enter the Id to identificate your contact.', RESTservice.inviteGuestByName(paramList));
    }

    @isTest
    public static void testPutInsertDuplicateGuest() {
        List<Contact> existedContacts = [
                SELECT Name
                FROM Contact
                WHERE Name != 'A1'
                LIMIT 3
        ];

        List<String> paramList = new List<String>();
        List<Guest__c> guestsToInvite = new List<Guest__c>();
        for(Contact existedContact : existedContacts) {
            paramList.add(existedContact.Name);
            Guest__c newGuest = new Guest__c(Contact__c = existedContact.Id);
            guestsToInvite.add(newGuest);
        }

        System.assertEquals(guestsToInvite.size() + ' guests are invited', RESTservice.inviteGuestByName(paramList));
    }

    @isTest
    public static void testPatch(){
        List<Guest__c> uninvitedGuests = [
                SELECT Name
                FROM Guest__c
                WHERE Is_Invited__c = false
        ];
        List<Guest__c> updatedList = new List<Guest__c>();
        for(Guest__c uninvitedGuest : uninvitedGuests){
            uninvitedGuest.Is_Invited__c = true;
            updatedList.add(uninvitedGuest);
        }
        System.assertEquals('This Guests were updated ' + updatedList, RESTservice.updateUninvitedGuests());
    }
   
    @isTest
    public static void testDelete(){
        String param = 'C-100069';
        
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/test/' + param;
        req.httpMethod = 'GET';

        RestContext.request = req;
        RestContext.response= res;
        
        System.assertEquals('Guest is deleted' , RESTservice.deleteGuest());
    }

}