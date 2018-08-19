/**
 * Created by User on 17.08.2018.
 */

public with sharing class ContactEventController {
    @AuraEnabled
    public static List<Contact> getContacts(){
        List<Contact> contacts = [
                SELECT Name, Id
                FROM Contact
                WHERE Name LIKE 'A%'
        ];
        System.debug('Apex works');
        System.debug(contacts);
        return contacts;
    }
}