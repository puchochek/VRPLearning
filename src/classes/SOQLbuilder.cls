/**
 * Created by User on 23.07.2018.
 */

public with sharing class SOQLbuilder {

//get one object by dynamic SOQL and validate parameters as a string value
    public static void getSObject(String objectName, List<String> objectFields) {
        List<sObject> sObjects;
        Boolean isEmpt = objectFields.isEmpty();
        if (((objectName.startsWithIgnoreCase('acc'))||(objectName.startsWithIgnoreCase('cont'))) && !isEmpt){

        String forQwery = String.valueof(objectFields);
        String finalForQwery = (forQwery.removeStart('(')).removeEnd(')');
        sObjects = Database.query('SELECT ' + finalForQwery + ' FROM ' + objectName +  ' LIMIT 2');
        } else {
            System.debug('You have to select Contact or Account and fill a field list');
        }
        System.debug(sObjects);
    }


    //get a map of objects by dynamic SOQL and handle Exceptions
    public static void getSObjects( Map<String, List<String>> inputData) {
        Map<String, List<sObject>> resultData = new Map<String, List<sObject>>();
        for (String objName : inputData.keySet()) {
            String forQwery = String.valueof(inputData.get(objName));
            String finalForQwery = (forQwery.removeStart('(')).removeEnd(')');
                try {
                    String q = 'SELECT ' + finalForQwery + ' FROM ' + objName + ' LIMIT 2';
                    resultData.put(objName, Database.query(q));
                } catch (DmlException e) {
                    System.debug('DmlException caught: ' + e.getMessage());
                } catch(SObjectException e) {
                    System.debug('SObjectException caught: ' + e.getMessage());
                } catch (ListException e) {
                    System.debug('ListException caught: ' + e.getMessage());
                } catch (NullPointerException e) {
                    System.debug('NullPointerException caught: ' + e.getMessage());
                } catch (NoSuchElementException e) {
                    System.debug('NoSuchElementException caught: ' + e.getMessage());
                } catch (QueryException e) {
                    System.debug('QueryException caught: ' + e.getMessage());
                } catch (StringException e) {
                    System.debug('StringException caught: ' + e.getMessage());
                } catch (TypeException e) {
                    System.debug('TypeException caught: ' + e.getMessage());
                } catch (Exception e) {
                    System.debug('Exception caught: ' + e.getMessage());
                }
        }
        System.debug(resultData);
    }

//insert objects and handle with Database.Error
    public  static void insertObjects(String objName, String fieldOne, String fieldTwo, String descrOne, String descrTwo) {
        sObject sObj = Schema.getGlobalDescribe().get(objName).newSObject();
        sObj.put(fieldOne , descrOne);
        sObj.put(fieldTwo , descrTwo);
        Database.SaveResult result = Database.insert(sObj, false);
        if (result.isSuccess()) {
            System.debug(objName + ' was successfully inserted');
        } else {
            for (Database.Error err : result.getErrors()) {
                System.debug('The following error has occurred.');
                System.debug(err.getStatusCode() + ': ' + err.getMessage());
            }
        }
        System.debug(sObj);
    }

//update objects and handle with showDMLOperationResult private method
    public static void updateObjects(String objName, String fieldOne, String descrOne) {
        List<sObject> selectObjects = Database.query('SELECT Name, Description ' + ' FROM ' + objName +  ' LIMIT 2');
        for (sObject myObj : selectObjects) {
            myObj.put(fieldOne, descrOne);
        }
        Database.SaveResult[] updateList = Database.update(selectObjects, false);
        System.debug(updateList);
        showDMLOperationResult(objName + ' was successfully updated.', updateList);

        System.debug(selectObjects);
    }

//delete objects and handle with Database.Error
    public static void deleteObjects(String objName, String forDelete) {
        List<sObject> delList = Database.query('SELECT ' + forDelete + ' FROM ' + objName + ' LIMIT 2');
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
                System.debug(myObj.getErrors());
            }
        }
   }

    //get object and update Phone field if it is correct (regex)
    public static void updatedWithPhone(String objectName, String numb) {
        List<sObject> sObjects = Database.query('SELECT Name FROM ' + objectName + ' LIMIT 2');
        Boolean isCorrectNum = Pattern.compile('\\D*?(\\d\\D*?){10}').matcher(numb).matches();
        if (isCorrectNum) {
            for (sObject myObj : sObjects){
                myObj.put('Phone', '8' + numb);
            }
            Database.SaveResult[] resultList = Database.update(sObjects, false);
            showDMLOperationResult(objectName + ' was successfully updated.', resultList);
        } else {
                System.debug('Phone number have to be entered in correct format (xxx)xxx-xxxx');
                }


        System.debug(sObjects);

    }

    private static void showDMLOperationResult(String successResult, List<Database.SaveResult> results) {
        for (Database.SaveResult res : results) {
            if (res.isSuccess()) {
                System.debug(successResult);
            } else {
                for (Database.Error err : res.getErrors()) {
                    System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                }
            }
        }
    }

}