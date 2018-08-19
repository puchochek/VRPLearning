/**
 * Created by User on 09.08.2018.
 */

trigger ContactDescriptionTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if (trigger.isAfter&&trigger.isUpdate) {
        if (ContactDescriptionTriggerHandler.isTriggerExecuted != true) {
            ContactDescriptionTriggerHandler.isTriggerExecuted = true;
            ContactDescriptionTriggerHandler.changeContDescription(Trigger.old, Trigger.new);
            ContactDescriptionTriggerHandler.isTriggerExecuted = false;
//
        }
    }
}