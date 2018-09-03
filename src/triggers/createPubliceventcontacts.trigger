trigger createPubliceventcontacts on InsertContacts__e (after insert) {
    List<Contact> contactsToInsert = new list<Contact>();
    for (InsertContacts__e event : Trigger.New) {
        Contact publicEventContact = new Contact();
        publicEventContact.LastName = event.Name__c;
        publicEventContact.Title = event.Title__c; 
        contactsToInsert.add(publicEventContact);            
    }
    if (contactsToInsert.size() > 0) {
        insert contactsToInsert;
    }

}