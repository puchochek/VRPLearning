/**
 * Created by User on 26.07.2018.
 */

public with sharing class SortPositionTriggerHandler {
    public static Boolean isTriggerExecuted;

    public static void definedEndPosition(List<Folder__c> endPosition, List<Folder__c> startPosition) {

        List<Folder__c> folders = [
                SELECT Name, Id, Position__c
                FROM Folder__c
                WHERE Id != :endPosition[0].Id
                ORDER BY Position__c
                ];
        if (endPosition[0].Position__c > (folders.size() + 1)) {
            endPosition[0].Position__c = (folders.size() + 1);
        }
        Integer countPos = 1;
        for (Folder__c foldersForSort : folders) {
            if (countPos == endPosition[0].Position__c) {
                //System.debug('Position ' + countPos + 'is occuped');
                countPos++;
                foldersForSort.Position__c = countPos;
                countPos++;
                //System.debug('So we set  ' + foldersForSort.Position__c);
            } else {
                //System.debug('not if');

                foldersForSort.Position__c = countPos;
                countPos++;
                //System.debug(foldersForSort.Position__c);
            }
        }
        update folders;
	}

    public static void deleteFolder(List<Folder__c> endPosition) {
        List<Folder__c> folders = [
                SELECT Name, Id, Position__c
                FROM Folder__c
                WHERE Id != :endPosition[0].Id
                ORDER BY Position__c
        ];
        Integer countPos = 1;
        for (Folder__c foldersAfterDelete : folders) {
            if(endPosition[0].Position__c > foldersAfterDelete.Position__c) {
                //System.debug('if');
                countPos++;
                //foldersAfterDelete.Position__c = countPos;
                //System.debug(foldersAfterDelete.Position__c);
            } else {
            if (endPosition[0].Position__c < foldersAfterDelete.Position__c)
                foldersAfterDelete.Position__c = countPos;
                countPos++;
                System.debug(foldersAfterDelete.Position__c);
            }
        }
        update folders;
    }

    public static void insertFolder(List<Folder__c> endPosition) {
        List<Folder__c> folders = [
                SELECT Name, Id, Position__c
                FROM Folder__c
                WHERE Id != :endPosition[0].Id
                ORDER BY Position__c
        ];

        if (endPosition[0].Position__c > (folders.size() + 1)) {
            System.debug(endPosition[0].Position__c);
            System.debug(folders.size() + 1);

            endPosition[0].Position__c = (folders.size() + 1);
        }
        
       update folders;
    }
}