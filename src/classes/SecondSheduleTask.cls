/**
 * Created by User on 18.07.2018.
 */

public with sharing class SecondSheduleTask implements Schedulable{
    public void execute(SchedulableContext sc) {
        BatchTask batchTest = new BatchTask();
        //System.enqueueJob(batchTest);
       
    }

}