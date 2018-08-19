/**
 * Created by User on 26.07.2018.
 */

trigger SortPosition on Folder__c (before update, after update, before delete, after delete, before insert) {
        if (trigger.isBefore && trigger.isUpdate)   {
            if (SortPositionTriggerHandler.isTriggerExecuted != true) {
                SortPositionTriggerHandler.isTriggerExecuted = true;
                SortPositionTriggerHandler.definedEndPosition(Trigger.new, Trigger.old);
                SortPositionTriggerHandler.isTriggerExecuted = false;
            }
        }
        if (trigger.isAfter && trigger.isDelete)   {
            if (SortPositionTriggerHandler.isTriggerExecuted != true) {
                SortPositionTriggerHandler.isTriggerExecuted = true;
                SortPositionTriggerHandler.deleteFolder(Trigger.old);
                SortPositionTriggerHandler.isTriggerExecuted = false;
            }
        }
        if (trigger.isBefore && trigger.isInsert) {
            if (SortPositionTriggerHandler.isTriggerExecuted != true) {
                SortPositionTriggerHandler.isTriggerExecuted = true;
                SortPositionTriggerHandler.insertFolder(Trigger.new);
                SortPositionTriggerHandler.isTriggerExecuted = false;
            }

//
        }
}