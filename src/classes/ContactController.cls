public with sharing class ContactController {
    @AuraEnabled
    public static List<Contact> getContacts(){
        List<Contact> contacts = [
                SELECT Name, Birthdate, Email
                FROM Contact
        ];
        System.debug('Apex works');
        System.debug(contacts);
        return contacts;
    }

}