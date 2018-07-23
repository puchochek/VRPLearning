/**
 * Created by User on 18.07.2018.
 */

public with sharing class BatchTask implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext BC){
    return Database.getQueryLocator('SELECT Name FROM Contact WHERE FirstName = \'FirstJobNew\' AND LastName = \'SeconJobNew2\'');
    }
    public void execute(Database.BatchableContext BC, List<Contact> contactsForBatch) {
        for (Contact cont : contactsForBatch){
            cont.Title = 'Async Apex';
        }
        update contactsForBatch;
    }
    public void finish(Database.BatchableContext BC){

    }


}