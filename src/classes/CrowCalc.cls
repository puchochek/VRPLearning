/**
 * Created by User on 11.07.2018.
 */

public with sharing class CrowCalc {
    // add new crows to DB, retutn true on success
    public static Boolean addCrows(Integer numberOfCrows) {
        if (numberOfCrows == null) {
            return false;
        }

        List<Crow__c> crowsToAdd = new List<Crow__c>();

        for (Integer i = 0; i < numberOfCrows; i++) {
            crowsToAdd.add(new Crow__c());
        }

        try {
            insert crowsToAdd;
        } catch (DmlException e) {
            System.debug(e.getMessage());

            return false;
        }

        return true;
    }

    // subtract crows from DB, retutn true on success
    public static Boolean subtractCrows(Integer numberOfCrows) {
        if (numberOfCrows == null) {
            return false;
        }

        List<Crow__c> crowsToSubtract = [SELECT Id FROM Crow__c LIMIT :numberOfCrows];

        try {
            delete crowsToSubtract;
        } catch (DmlException e) {
            System.debug(e.getMessage());

            return false;
        }

        return true;
    }

    // return number of crows in DB
    public static Integer getTotal() {
        return [SELECT COUNT() FROM Crow__c];

    }

    // delete all crows
    public static Boolean resetCalc() {
        return subtractCrows(getTotal());
    }
}