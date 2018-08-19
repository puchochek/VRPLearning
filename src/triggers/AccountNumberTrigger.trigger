/**
 * Created by User on 09.08.2018.
 */

trigger AccountNumberTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if (trigger.isBefore&&trigger.isUpdate) {
        AccountNumberTriggerHandler.updateContacts(Trigger.old, Trigger.new);
    }
    //
}