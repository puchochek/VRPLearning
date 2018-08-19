/**
 * Created by Lena on 19.08.18.
 */

public with sharing class RescentContactsApp {

    @AuraEnabled
    public static List<Contact> getRescentContacts() {
        List<Contact> rescentContacts = [
                SELECT Name, AccountId, CreatedDate
                FROM Contact
                WHERE CreatedDate >= :datetime.now().addDays(-7)
        ];
        System.debug('Im work');
        return rescentContacts;
    }

}