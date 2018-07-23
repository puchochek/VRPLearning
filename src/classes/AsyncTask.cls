/**
 * Created by User on 18.07.2018.
 */

public with sharing class AsyncTask implements Queueable {
    public void execute(QueueableContext context) {
        List<Contact> asyncConatcts = new  List<Contact>();
        for (Integer i = 0; i <=10; i++) {
            Contact someCont = new Contact(FirstName='FirstJobNew');
            asyncConatcts.add(someCont);
        }
       System.enqueueJob(new SecondAsyncTask(asyncConatcts));
    }
//
}