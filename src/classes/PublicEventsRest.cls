@RestResource(UrlMapping='/publicevent/*')

global without sharing class PublicEventsRest {

    @HttpPost
    global static void useSecretWord(String lastName, String title) {

        InsertContacts__e eventInstance = new InsertContacts__e(
        Name__c = lastName,
        Title__c = title
        );
        Database.SaveResult result = EventBus.publish(eventInstance);   
    }
    
    @HttpGet
    global static List<Contact> getContacts() {

        List<Contact> eventContacts = [
                SELECT LastName
                FROM Contact
                WHERE CreatedBy.Name = 'Automated Process'
        ];
        return eventContacts;
    }
//
    /*http://publicevents-developer-edition.ap4.force.com/publicevent/services/apexrest/publicevent/*/
}