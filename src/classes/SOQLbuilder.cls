/**
 * Created by User on 23.07.2018.
 */

public with sharing class SOQLbuilder {

    public static List<sObject> getSObject(String objectName, List<String> objectFields) {
        List<sObject> sObjects;
        String forQwery = String.valueof(objectFields);
        String finalForQwery = (forQwery.removeStart('(')).removeEnd(')');
        sObjects = Database.query('SELECT ' + finalForQwery + ' FROM ' + objectName +  ' LIMIT 2');

        System.debug(sObjects);
        return sObjects;
    }

    public static Map<String, List<sObject>> getSObjects( Map<String, List<String>> inputData) {
        Map<String, List<sObject>> resultData = new Map<String, List<sObject>>();
        for (String objName : inputData.keySet()) {
            String forQwery = String.valueof(inputData.get(objName));
            String finalForQwery = (forQwery.removeStart('(')).removeEnd(')');
            String q = 'SELECT ' + finalForQwery + ' FROM ' + objName + ' LIMIT 2';
            resultData.put(objName, Database.query(q));
        }
        System.debug(resultData);
        return resultData;
    }


    public  static void insertObject(String objName) {
        List<Account> myAcc = new List<Account>();
        myAcc.add(new Account(Name = 'Lena'));
        myAcc.add(new Account(Name = 'Elena'));
        Database.SaveResult[] resultList = Database.insert(myAcc, false);
        for (Database.SaveResult acc : resultList) {
            if (acc.isSuccess()) {

                System.debug('Successfully inserted account. Account ID: ' + acc.getId());
            } else {
                for (Database.Error err : acc.getErrors()) {
                    System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                }
            }
        }
    }


    public static void updateObjects(String objName) {
        List<sObject> selectObjects = Database.query('SELECT Name, Description ' + ' FROM ' + objName +  ' LIMIT 2');
        System.debug(selectObjects);
        for (sObject myObj : selectObjects) {
            System.debug(myObj);
            myObj.put('Description', 'New description');
            Database.SaveResult[] updateList = Database.update(selectObjects, false);
            for (Database.SaveResult acc : updateList) {
                if (acc.isSuccess()) {

                    System.debug(objName + ' was successfully updated.');
                } else {
                    for (Database.Error err : acc.getErrors()) {
                        System.debug('The following error has occurred.');
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    }
                }
            }
        }
        System.debug(selectObjects);
    }


    public static void deleteObjects(String objName) {
        List<sObject> delList = Database.query('SELECT Name' + ' FROM ' + objName +  ' LIMIT 2');
        System.debug(delList);
        Database.DeleteResult[] deleteList = Database.delete(delList, false);
        for (Database.DeleteResult myObj :deleteList) {
            if (myObj.isSuccess()) {
                System.debug(objName + ' was successfully deleted.');
            } else {
                for (Database.Error err : myObj.getErrors()) {
                    System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                }
            }
        }

   }


}