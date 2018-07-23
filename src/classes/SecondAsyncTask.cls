/**
 * Created by User on 18.07.2018.
 */

public with sharing class SecondAsyncTask implements Queueable {
   public List<Contact> putContacts;
    public SecondAsyncTask(List<Contact> someList) {
        this.putContacts = someList;
    }

    public void execute(QueueableContext context) {
        for (Contact contactToUpdate : putContacts) {
        Contact newCont = new Contact();
            contactToUpdate.LastName = 'SeconJobNew2';
        }
        insert putContacts;
    }

}