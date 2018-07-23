/**
 * Created by User on 23.07.2018.
 */

public with sharing class SOQLbuilder {

    public static List<sObject> getSObject(String objectName, List<String> objectFields) {
        List<sObject> sObjects;
        System.debug(objectName);
        System.debug(objectFields);
        for (Integer i = 0; i < objectFields.size(); i++) {
            sObjects = Database.query('SELECT ' + objectFields[i] + ' FROM ' + objectName);
        System.debug(sObjects);
        }
        return sObjects;
    }

    public static Map<String, List<sObject>> getSObjects( Map<String, List<String>> inputData) {
        Map<String, List<sObject>> resultData = new Map<String, List<sObject>>();
        System.debug(inputData);
        System.debug(inputData.keySet());
        for (String objName : inputData.keySet()) {
            System.debug(objName);
            String forQwery = String.valueof(inputData.get(objName));
            String finalForQwery = (forQwery.removeStart('(')).removeEnd(')');
            System.debug(forQwery);
            System.debug(finalForQwery);

            String q = 'SELECT ' + finalForQwery + ' FROM ' + objName + ' LIMIT 2';
            System.debug(q);
            resultData.put(objName, Database.query(q));
        }
        System.debug(resultData);
        return resultData;
    }
}