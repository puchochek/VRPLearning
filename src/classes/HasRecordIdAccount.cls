/**
 * Created by User on 17.08.2018.
 */

public with sharing class HasRecordIdAccount {

    @AuraEnabled
    public static List<Contact> getContactByAccountId(String accId) {
        System.debug(accId);

        List<Contact> relatedContacts = [
                SELECT Name, Id
                FROM Contact
                WHERE AccountId = :accId
        ];
        System.debug('Im work');
        System.debug(relatedContacts);
        return relatedContacts;
    }
}