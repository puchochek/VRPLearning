/**
 * Created by User on 08.08.2018.
 */

trigger TaskInsertTrigger on Task (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if (trigger.isBefore && trigger.isInsert)   {
        if (TaskInsertTriggerHand.isTriggerExecuted != true) {
            TaskInsertTriggerHand.isTriggerExecuted = true;
            TaskInsertTriggerHand.createNewTask(Trigger.new);
            TaskInsertTriggerHand.isTriggerExecuted = false;
        }

    }

}