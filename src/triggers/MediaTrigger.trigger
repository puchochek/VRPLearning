trigger MediaTrigger on Media__c (before insert, after insert, before update, after update, before delete, after delete ) {
    if (trigger.isBefore && trigger.isInsert){
        MediaTriggerHandler.setLookup(Trigger.new);
    }
    //
}