public class FreeAccount {
    public static void setContactsToAccounts() {
        List<Contact> allContacts = [
            SELECT LastName, AccountId 
            FROM Contact
        ];
        List<Account> allAccounts = [
            SELECT Name
            FROM Account
        ];
        Integer averageContactNumber = Integer.valueOf(Math.round(Double.valueOf(allContacts.size()) / Double.valueOf(allAccounts.size())));
        System.debug('с ' + allContacts.size()); 
        System.debug('ф ' + allAccounts.size()); 
        System.debug(averageContactNumber);
        Map<Id, Integer> ContactsOnAccounts = new Map<Id, Integer>();
        List<Contact> lonleyContacts = new List<Contact>(); 
        List<Contact> contactsForUpdate = new List<Contact>();
        
        for (Account acc : allAccounts) {
            ContactsOnAccounts.put(acc.Id, 0);
        }
        for (Contact cont : allContacts) {
            if (cont.AccountId != null) {
                Integer countContacts = ContactsOnAccounts.get(cont.AccountId);
                ContactsOnAccounts.put(cont.AccountId, countContacts + 1);
            }
        }
         
        for (Contact cont : allContacts) {
            Integer countContacts = ContactsOnAccounts.get(cont.AccountId);
            if (countContacts > averageContactNumber) {
                ContactsOnAccounts.put(cont.AccountId, countContacts - 1);
                cont.AccountId = null;
            }
            if (cont.AccountId == null) {
                lonleyContacts.add(cont);                  
            }
        }
        update allContacts;
        
		System.debug('Values no more than average ' + ContactsOnAccounts); 
        System.debug('Contacts withoun any acc START ' + lonleyContacts.size());
        
        
        for (Account acc : allAccounts) {    
            Integer countContacts = ContactsOnAccounts.get(acc.Id);
            Integer numberOfCreatedContacts = 0;
            while (countContacts < averageContactNumber) {                                              
                if (lonleyContacts.size() > 0) {                                                                                                                    
                    ContactsOnAccounts.put(acc.Id, countContacts + 1);
                    Contact cont = lonleyContacts.remove(0);
                    cont.AccountId = acc.Id;
                    contactsForUpdate.add(cont);
                    countContacts = countContacts + 1;
                }  else {                    
                    Contact cont = new Contact();
                    cont.AccountId = acc.Id;
                    cont.LastName = acc.Name + numberOfCreatedContacts;
                    contactsForUpdate.add(cont);
                    ContactsOnAccounts.put(acc.Id, countContacts + 1);
					numberOfCreatedContacts++; 
                    countContacts = countContacts + 1;
                }                                                                                                             
            }             
        }
        upsert contactsForUpdate;
		
    	System.debug('Contacts withoun any acc FINISH ' + lonleyContacts.size());
		System.debug('New or Updated cont ' + contactsForUpdate);
        System.debug(allAccounts.size());
        System.debug(allContacts.size());
    }
}