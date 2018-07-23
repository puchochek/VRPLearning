/**
 * Created by User on 11.07.2018.
 */
@isTest
public class CrowCalcTest {

    @testSetup
    static void setup(){
        CreateNewCrows(10);
    }

    private static void CreateNewCrows(Integer crowsNumber){
        List<Crow__c> crowsForTesting = new List<Crow__c>();
        for (Integer i = 0; i < crowsNumber; i++) {
            crowsForTesting.add(new Crow__c());
        }
        insert crowsForTesting;
    }

    @isTest
    public static void testAddCrows() {

        Integer initialCrows = [SELECT COUNT() FROM Crow__c];
        Boolean addCrowsResult = CrowCalc.addCrows(10);
        Integer crowsAfter = [SELECT COUNT() FROM Crow__c]; //- initialCrows;
        System.assert(crowsAfter == (initialCrows + 10), 'Here is Wrong answer!');
        System.assert(addCrowsResult, 'Success addition not "true"');

    }

    @isTest
    public static void testSubtractCrows() {

        Integer initialCrows = [SELECT COUNT() FROM Crow__c];
        Boolean delCrowsResult = CrowCalc.subtractCrows(5);
        Integer crowsAfter = [SELECT COUNT() FROM Crow__c];
        System.assert(crowsAfter == (initialCrows - 5), 'Here is Wrong answer!');
        System.assert(delCrowsResult, 'Success addition not "true"');

    }

    @isTest
    public static void testGetTotal() {
        Integer initialCrows = [SELECT COUNT() FROM Crow__c];
        System.debug(CrowCalc.getTotal());
        System.assert(initialCrows == CrowCalc.getTotal(), 'Here is Wrong answer!');
    }

    @isTest
    public static void testResetCalc() {
        Boolean resetCrowsResult = CrowCalc.resetCalc();
        Integer crowsAfter = [SELECT COUNT() FROM Crow__c];
        System.assert(crowsAfter == 0, 'Here is Wrong answer!');
        System.assert(resetCrowsResult, 'Success addition not "true"');         
    }
    
    @isTest
    public static void negTestAddCrows() {
        Boolean negDelCrowsResult = CrowCalc.addCrows(null);
        System.assert(!negDelCrowsResult, 'Fail addition not "false"');
    }
    
    @isTest
    public static void negTestSubtractCrows() {
        Boolean addNegCrowsResult = CrowCalc.subtractCrows(null);
        System.assert(!addNegCrowsResult, 'Fail addition not "false"');
    }
    
    @isTest
    public static void testAddManyCrows() {

        Integer initialCrows = [SELECT COUNT() FROM Crow__c];
        Boolean addCrowsResult = CrowCalc.addCrows(9000);
        Integer crowsAfter = [SELECT COUNT() FROM Crow__c]; //- initialCrows;
        System.assert(crowsAfter == (initialCrows + 9000), 'Here is Wrong answer!');
        System.assert(addCrowsResult, 'Success addition not "true"');

    }
    
   /* @isTest
    public static void testSubtractManyCrows() {
		CreateNewCrows(5000);
        Integer initialCrows = [SELECT COUNT() FROM Crow__c];
        Boolean delCrowsResult = CrowCalc.subtractCrows(4000);
        Integer crowsAfter = [SELECT COUNT() FROM Crow__c];
        System.debug(initialCrows);
        System.debug(crowsAfter);
        
        System.assert(crowsAfter == (initialCrows - 4000), 'Here is Wrong answer!');
        System.assert(delCrowsResult, 'Success addition not "true"');

    }
    
    @isTest
    public static void testSubtractMoreThanCreateCrows() {

        Integer initialCrows = [SELECT COUNT() FROM Crow__c];
        Boolean delCrowsResult = CrowCalc.subtractCrows(25);
        Integer crowsAfter = [SELECT COUNT() FROM Crow__c];
        System.assert(crowsAfter == 0, 'Here is Wrong answer!');
        System.assert(delCrowsResult, 'Success addition not "true"');

    }*/

    @isTest
    static void catchDML() {
        Profile testProfile = [SELECT Id
        FROM Profile
        WHERE Name = 'Read Only'
        LIMIT 1];

        User testUser = new User(LastName = 'New Test User',
                Username = 'puchochek@gmail.com.test',
                Email = 'puchochek@gmail.com',
                Alias = 'newtu',
                TimeZoneSidKey = 'GMT',
                LocaleSidKey = 'en_GB',
                EmailEncodingKey = 'ISO-8859-1',
                ProfileId = testProfile.Id,
                LanguageLocaleKey = 'en_US');
        
        insert testUser;
        
        Integer initialCrows = [SELECT COUNT() FROM Crow__c];
		Boolean addCrowsResult;
        	System.debug('Current User: ' + UserInfo.getUserName());
			System.debug('Current Profile: ' + UserInfo.getProfileId());
        System.runAs(testUser) {
            System.debug('Current User: ' + UserInfo.getUserName());
			System.debug('Current Profile: ' + UserInfo.getProfileId());
        	addCrowsResult = CrowCalc.addCrows(10);
        }
        
        Integer crowsAfter = [SELECT COUNT() FROM Crow__c];
        System.assert(crowsAfter == initialCrows, 'Here is Wrong answer!');
        System.assert(!addCrowsResult, 'Success addition not "true"');


    }


}