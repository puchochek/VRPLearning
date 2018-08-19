public class changeDNCHandler {
    
    public static Boolean isTriggerExecuted;
    
    public static void changeDNCcont(List<Contact> contacts) {
        Set<Id> myId = new Set<Id>();
        Map<Id, Boolean> doNotCallById = new Map<Id, Boolean>();
        for(Contact insertedContacts : contacts) {
            if (insertedContacts.AccountId != null) {
                myId.add(insertedContacts.AccountId);
                doNotCallById.put(insertedContacts.AccountId, insertedContacts.DoNotCall); 
        	}
        }
        
        List<Contact> contsForChange = [
            SELECT Name, DoNotCall, AccountId
            FROM Contact
            WHERE AccountId IN : myId
        ];
        
        for (Contact contToChange : contsForChange) {
            contToChange.DoNotCall = doNotCallById.get(contToChange.AccountId);
        }
        update contsForChange;   
    }
    
	public static void changeDNCandAccId(List<Contact> newContacts, List<Contact> oldContacts) {
        //System.debug('newContacts: ' + newContacts);
        //System.debug('oldContacts: ' + oldContacts);
        
        Set<Id> oldAccountsIds = new Set<Id>();
        //Set<Id> newAccountsIds = new Set<Id>();
        Map<Id, Boolean> oldDoNotCallById = new Map<Id, Boolean>(); //To check if DoNotCall is changed
        Map<Id, Id> newAccountIdsByOldAccountIds = new Map<Id, Id>();//To get new AccountId  
        Map<Id, Id> oldAccountIdsByContactId = new Map<Id, Id>();//To check if AccountId is changed
        Map<Id, Boolean> newDoNotCallById = new Map<Id, Boolean>();//To get new DNC by Id
        
		for (Contact oldContact : oldContacts) {
			if (oldContact.AccountId != null) {
                oldAccountIdsByContactId.put(oldContact.Id, oldContact.AccountId);
                oldAccountsIds.add(oldContact.AccountId);
                oldDoNotCallById.put(oldContact.Id, oldContact.DoNotCall);
			}
		}
        //System.debug('Old AccountId ' + oldAccountIdsByContactId);
        
		for (Contact newContact : newContacts) {            
            	newAccountIdsByOldAccountIds.put(oldAccountIdsByContactId.get(newContact.Id), newContact.AccountId);              
                newDoNotCallById.put(newContact.AccountId, newContact.DoNotCall);
           //
            //newAccountsIds.add(newContact.AccountId);
		}
        //System.debug('newAccountsId: ' + newAccountsIds);
        //System.debug('New AccountId ' + newAccountIdsByOldAccountIds);
        
    	List<Contact> contactsToUpdateAccId = [
            SELECT Name, DoNotCall, AccountId
            FROM Contact
            WHERE AccountId IN : oldAccountsIds
        ];
        
        for (Contact contactToUpdateAccId : contactsToUpdateAccId) {
            if (contactToUpdateAccId.AccountId != oldAccountIdsByContactId.get(contactToUpdateAccId.Id)) {
            contactToUpdateAccId.AccountId = newAccountIdsByOldAccountIds.get(contactToUpdateAccId.AccountId);
            //System.debug('New field is ' + newAccountIdsByOldAccountIds.get(contactToUpdateAccId.AccountId));
            }
            if (contactToUpdateAccId.DoNotCall != oldDoNotCallById.get(contactToUpdateAccId.Id)) {
                contactToUpdateAccId.DoNotCall = newDoNotCallById.get(contactToUpdateAccId.AccountId);
            }
        }
        
        System.debug(contactsToUpdateAccId);
        update contactsToUpdateAccId;
	}

}