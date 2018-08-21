/**
 * Created by User on 20.08.2018.
 */

public with sharing class CustomEvent {
    
    @AuraEnabled
    public static List<Contact> getContactsOnL() {
        List<Contact> contactsOnL = [
                SELECT LastName
                FROM Contact
                WHERE LastName LIKE 'L%'
        ];
        System.debug('contacts on L ' + contactsOnL);
        return contactsOnL;
    }

}