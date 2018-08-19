/**
 * Created by User on 08.08.2018.
 */

public with sharing class TaskInsertTriggerHand {

    public static Boolean isTriggerExecuted;

    public static void createNewTask(List<Task> newTask) {
            Task secondTask = new Task();

            secondTask.OwnerId = newTask[0].OwnerId;
            secondTask.Subject = newTask[0].Subject;
            secondTask.Priority = newTask[0].Priority;
            secondTask.Status = newTask[0].Status;
            secondTask.ActivityDate = newTask[0].ActivityDate.addDays(1);
            insert secondTask;
    }
}