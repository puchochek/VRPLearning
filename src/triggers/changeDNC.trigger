trigger changeDNC on Contact (after insert, after update) {
    if(trigger.isAfter&&trigger.isInsert){
        changeDNCHandler.changeDNCcont(Trigger.new);
    }
    
    if(trigger.isAfter&&trigger.isUpdate){
        if (changeDNCHandler.isTriggerExecuted != true) {
            changeDNCHandler.isTriggerExecuted = true;
            changeDNCHandler.changeDNCandAccId(Trigger.new, Trigger.Old);
            changeDNCHandler.isTriggerExecuted = false;
        }
    }
}