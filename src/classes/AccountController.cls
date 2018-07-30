/**
 * Created by User on 30.07.2018.
 */

public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accounts = [
                SELECT Name, Site
                FROM Account
        ];
        System.debug('Apex works');
        System.debug(accounts);
        return accounts;
    }

}