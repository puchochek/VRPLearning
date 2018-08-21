/**
 * Created by User on 20.08.2018.
 */
@IsTest
public with sharing class RefactorTest {
    @IsTest
    public static void funcTest(){
        List<Contact> contacts = new List<Contact>{
                new Contact(LastName = 'test'),
                new Contact(LastName = 'test')
        };
        insert contacts;
        List<Lead> leads = new List<Lead>{
                new Lead(LastName = 'test', Company = 'company'),
                new Lead(LastName = 'test', Company = 'company')
        };
        insert leads;

        Test.startTest();
        Refactor.func();
        Test.stopTest();

        System.assertEquals(1, [SELECT Id FROM Contact].size());
        System.assertEquals(1, [SELECT Id FROM Lead].size());
    }
}