trigger TestTrigger on Contact (before insert, before update) {
    if (trigger.isBefore && trigger.isUpdate){
        TestTriggerHandler.addPrefix(Trigger.new, Trigger.old);
    }
}