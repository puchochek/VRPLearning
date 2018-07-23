/**
 * Created by User on 18.07.2018.
 */

public with sharing class SheduleTask implements Schedulable{
    public void execute(SchedulableContext sc) {
        AsyncTask test = new AsyncTask();
        System.enqueueJob(test);
    }

}