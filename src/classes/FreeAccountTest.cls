@isTest
public class FreeAccountTest {
    @testSetup    
    private static void CreateAccounts(){
        List<Account> accsForTesting = new List<Account>();
        List<Contact> contsForTesting = new List<Contact>();
        for (Integer i = 0; i < 3; i++) {
            Account newAcc = new Account();
            newAcc.Name = 'Test' + i;
            newAcc.Id = '123' + i;
            Account newAccA = new Account();
            newAccA.Name = 'TestA' + i;
            newAccA.Id = '333' + i;
            accsForTesting.add(newAccA);
            accsForTesting.add(newAcc);
        }
        for (Integer i = 0; i < 3; i++) {
            Contact newCont = new Contact();
            newCont.LastName = 'TestA' + i;
            newCont.AccountId = '123' + i;
            Contact newContZ = new Contact();
            newContZ.LastName = 'TestZ' + i;
            contsForTesting.add(newContZ);
            contsForTesting.add(newCont);
        }
        
        insert accsForTesting;
        insert contsForTesting;                
    }
    
    @isTest
    public static void freeAcc() {

        
        
        //System.assert(addCrowsResult, 'Success addition not "true"');

    }

}