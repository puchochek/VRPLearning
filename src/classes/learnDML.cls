/**
 * Created by Lena on 08.07.18.
 */

public with sharing class learnDML {
    public static void insertContacts() {
//        List<Contact> newContacts = new List<Contact>();
//        List<Contact> existingContacts = [SELECT LastName FROM Contact WHERE LastName LIKE '%TestContact'];
//        System.debug('Already exist ' + existingContacts);
//        for (Integer i = 0; i < 5; i++) {
//            Contact newContact = new Contact(LastName = i + 'TestContact');
//            newContacts.add(newContact);
//        }
//        insert newContacts;
//        System.debug('Just created' + newContacts);
//
//        for (Integer i = 0; i < existingContacts.size(); i++) {
//            existingContacts[i].Title = 'Developer';
//            System.debug('Existed contacts are ' + existingContacts);
//        }
//        for (Integer i = 0; i < 5; i++) {
//            Contact anotherNewContact = new Contact(LastName = i + 'AnotherTestContact', Title = 'Developer');
//            newContacts.add(anotherNewContact);
//        }
//        List<Contact> allContacts = new List<Contact>();
//        allContacts.addall(newContacts);
//        allContacts.addall(existingContacts);
//        upsert allContacts;
//        System.debug('And now ' + allContacts);
//        delete existingContacts;
//        List<Contact> existingContacts = [SELECT LastName FROM Contact WHERE LastName LIKE '%TestContact' ALL ROWS];
//        undelete existingContacts;
//        System.debug('Wow ' + allContacts);
          List<Contact> contactsWithName = new List<Contact>();
          List<Contact> contactsWithoutName = new List<Contact>();
        for (Integer i = 0; i < 10; i++) {
            Contact contactWithName = new Contact(LastName = i + 'ContactWithName');
            contactsWithName.add(contactWithName);
        }
        for (Integer i = 0; i < 10; i++) {
            Contact contactWithoutName = new Contact();
            contactsWithoutName.add(contactWithoutName);
        }
        List<Contact> allNamedContacts = new List<Contact>();
        allNamedContacts.addAll(contactsWithName);
        allNamedContacts.addAll(contactsWithoutName);
        List<Database.SaveResult> resultList = Database.insert(allNamedContacts, false);
        System.debug(resultList);
        System.debug(allNamedContacts);
        Savepoint nothingIsInserted = Database.setSavepoint();
        Integer successAmount = 0;
        for (Database.SaveResult savedResult : resultList) {
            if (savedResult.isSuccess()) {
                successAmount++;
            }
        }
        System.debug('Succesfully inserted ' + successAmount);
        System.debug(allNamedContacts.size());
        if (allNamedContacts.size()>successAmount) {
            Database.rollback(nothingIsInserted);
        }
    }
}