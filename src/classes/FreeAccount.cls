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
        Integer averageContactNumber = Integer.valueOf(Math.round(allContacts.size() / allAccounts.size()));
        System.debug(averageContactNumber);
        Map<Id, Integer> ContactsOnAccounts = new Map<Id, Integer>();
        List<Id> lonleyContacts = new List<Id>();
		List<Contact> contactsWithAccount = new List<Contact>();        
        
        for (Account acc : allAccounts) {
            ContactsOnAccounts.put(acc.Id, 0);
        }
        for (Contact cont : allContacts) {
            if (cont.AccountId != null) {
                Integer countContacts = ContactsOnAccounts.get(cont.AccountId);
                ContactsOnAccounts.put(cont.AccountId, countContacts + 1);
                contactsWithAccount.add(cont);
            }
        }
        //System.debug(ContactsOnAccounts);
        
        for (Contact cont : allContacts) {
            Integer countContacts = ContactsOnAccounts.get(cont.AccountId);
            if (countContacts > averageContactNumber) {
                ContactsOnAccounts.put(cont.AccountId, countContacts - 1);
                cont.AccountId = null;
            }
            if (cont.AccountId == null) {
                lonleyContacts.add(cont.Id);
                
                
            }
        }
        System.debug(allAccounts.size());
        System.debug(contactsWithAccount.size());
        System.debug(lonleyContacts.size());
        for (Contact cont : contactsWithAccount) {    
            if (ContactsOnAccounts.get(cont.AccountId) < averageContactNumber) {                
                System.debug(ContactsOnAccounts.get(cont.AccountId));
                /*while (ContactsOnAccounts.get(cont.AccountId) < averageContactNumber)  {                   
                    while (lonleyContacts.size()>0) {                                                                                                                    
                        ContactsOnAccounts.put(cont.AccountId, ContactsOnAccounts.get(cont.AccountId) + 1);
                        cont.AccountId = lonleyContacts.remove(0);
                    }
                }*/ 
                System.debug(lonleyContacts.size());                                                                                               
            }             
        }
        //System.debug(ContactsOnAccounts);
        //System.debug(lonleyContacts.size());
    } 

}