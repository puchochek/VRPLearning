/**
 * Created by User on 26.07.2018.
 */

trigger SortPosition on Folder__c (before update, after update) {
        if (trigger.isBefore && trigger.isUpdate)   {
            if (SortPositionTriggerHandler.isTriggerExecuted != true) {
                SortPositionTriggerHandler.isTriggerExecuted = true;
                SortPositionTriggerHandler.definedEndPosition(Trigger.new, Trigger.old);
                SortPositionTriggerHandler.isTriggerExecuted = false;
            }
        }

}