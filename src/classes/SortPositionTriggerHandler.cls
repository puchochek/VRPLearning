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

        Integer countPos = 1;
        for (Folder__c foldersForSort : folders) {
            System.debug(countPos);
            if (countPos == endPosition[0].Position__c) {
                System.debug('if');
                System.debug('Position ' + countPos + 'is occuped');
                countPos++;
                foldersForSort.Position__c = countPos;
                countPos++;
                System.debug('So we set  ' + foldersForSort.Position__c);
            } else {
                System.debug('not if');

                foldersForSort.Position__c = countPos;
                countPos++;
                System.debug(foldersForSort.Position__c);
            }
        }
        update folders;
	}
}