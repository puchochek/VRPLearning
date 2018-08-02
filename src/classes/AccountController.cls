/**
 * Created by User on 30.07.2018.
 */

public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> getAccounts() {
        List<Account> accounts = [
                SELECT Name, Site
                FROM Account
        ];
        System.debug('Apex works');
        System.debug(accounts);
        return accounts;
    }

    @AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contacts = [
                SELECT Name, Email, Birthdate
                FROM Contact
        ];
        System.debug('Apex works');
        System.debug(contacts);
        return contacts;
    }

    @AuraEnabled
    public static List<Contact> getObjByName(String nameToSearch) {
        String nameString = '%' + nameToSearch + '%';
        List<Contact> contacts = [
                SELECT Name, Email, Birthdate
                FROM Contact
                WHERE Name LIKE :nameString
        ];
        System.debug('Apex works');
        System.debug(contacts);
        return contacts;
    }


    @AuraEnabled
    public static List<Contact> getContByNumber(Integer numberOfContacts) {
        Integer contNumber = Integer.valueOf(numberOfContacts);

        System.debug(contNumber);
        List<Contact> contacts = [
                SELECT Name, Email, Birthdate
                FROM Contact
                LIMIT :contNumber
        ];
        System.debug('Apex works');
        System.debug(contacts);
        return contacts;
    }

    @AuraEnabled
    public static List<Contact> getContById(String inputValue){
        System.debug(inputValue);
        String contById = (String)JSON.deserialize(inputValue, String.class);
        System.debug(contById);
        List<Contact> contacts = [
        SELECT Name, Email, Birthdate
        FROM Contact
        WHERE Id = :contById
        ];
        System.debug('Apex works');
        System.debug(contacts);
        return contacts;
}
}