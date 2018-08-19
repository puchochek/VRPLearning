/**
 * Created by Lena on 19.08.18.
 */

public with sharing class UserGreetings {
    @AuraEnabled
    public static String getUserName() {
        String user = [
                SELECT Id, Name
                FROM User
                WHERE Id = :userInfo.getUserId()
        ].Name;

        System.debug('Apex works');
        return user;
    }

}