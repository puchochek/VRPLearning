/**
 * Created by Lena on 18.08.18.
 */

public with sharing class QuickActionAccount {
    @AuraEnabled
    public static Integer getContactByAccountId(String accId) {
        System.debug(accId);

        List<Contact> relatedContacts = [
                SELECT Name, Id
                FROM Contact
                WHERE AccountId = :accId
        ];
        System.debug('Im work');
        System.debug(relatedContacts);
        return relatedContacts.size();
    }
}