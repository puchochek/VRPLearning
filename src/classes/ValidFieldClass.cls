/**
 * Created by User on 07.08.2018.
 */

public with sharing class ValidFieldClass {
//
    public static void checkValid(String name, List<String> fieldName, List<String> fieldValue) {
        try {
            map<String, Schema.SObjectType> GlobalMap = Schema.getGlobalDescribe();
            map<String, Schema.SObjectField> FieldMap2 = GlobalMap.get(name).getDescribe().fields.getMap();

            List<String> checkedList = new List<String>();
            for (Integer i = 0; i < fieldName.size(); i++) {
                checkedList.add(String.valueOf(FieldMap2.get(fieldName[i])));
            }
            System.debug(checkedList);
//            Map<String, String> mapForInsert = new Map<String, String>();
//            for (Integer i = 0; i < checkedList.size(); i++) {
//                mapForInsert.put(checkedList[i], fieldValue[i]);
//            }
            sObject sObj = Schema.getGlobalDescribe().get(name).newSObject() ;
            //sObj.put(Schema.getGlobalDescribe().get(checkedList[0]), fieldValue[0]);
            sObj.put(checkedList[0], fieldValue[0]);
            sObj.put(checkedList[1], fieldValue[1]);

            Database.SaveResult result = Database.insert(sObj, false);
            if (result.isSuccess()) {
                System.debug(sObj + ' was successfully inserted');
            } else {
                for (Database.Error err : result.getErrors()) {
                    System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                }
            }
            System.debug(sObj);
        } catch (Exception e) {
            System.debug('Exception caught: ' + e.getMessage());
        }



    }

}