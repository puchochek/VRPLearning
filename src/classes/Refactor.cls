public class Refactor {

    public static void func() {
        try {
            Refactor.deleteDuplicates('Contact', new Set<String>{'Id', 'Name'});
            Refactor.deleteDuplicates('Lead', new Set<String>{'Id', 'Name'});
        } catch (Exception e) {
            System.debug('There is an error ' + e.getMessage());
        }
    }

    public static void deleteDuplicates(String objectApiName, Set<String> objectFields) {
        Set<String> uniqueObjectNamesSet = new Set<String>();
        Map<String, Id> duplicateObjects = new Map<String, Id>();
        List<sObject> objectsToDelete = new List<SObject>();
        
        String qwery = 'SELECT ' + String.join(new List<String>(objectFields), ', ') + ' FROM ' + objectApiName;
        List<sObject> sObjects = Database.query(qwery);

        for (sObject sObj : sObjects) {
            if(!uniqueObjectNamesSet.add(String.valueOf(sObj.get('Name')))) {
                duplicateObjects.put(String.valueOf(sObj.get('Name')), sObj.Id);
            }
        }
        List<Id> duplicateObjectsId = duplicateObjects.values();

        for (sObject sObj : sObjects) {
            if (duplicateObjectsId.contains(sObj.Id)) {
                objectsToDelete.add(sObj);
            }
        }
        System.debug(objectsToDelete);
        delete objectsToDelete;
    }

//    public static void deleteDuplicates(String objectApiName) {
//        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectApiName);
//        if (targetType == null) {
//            System.debug('Object type ' + objectApiName + ' is not supported.');
//        }
//
//        Set<String> uniqueObjectNamesSet = new Set<String>();
//        Map<String, Id> duplicateObjects = new Map<String, Id>();
//        List<sObject> objectsToDelete = new List<SObject>();
//
//        List<sObject> sObjects = Database.query('SELECT Name FROM ' + objectApiName);
//
//        for (sObject sObj : sObjects) {
//            if(!uniqueObjectNamesSet.add(String.valueOf(sObj.get('Name')))) {
//                duplicateObjects.put(String.valueOf(sObj.get('Name')), sObj.Id);
//            }
//        }
//        List<Id> duplicateObjectsId = duplicateObjects.values();
//
//        for (sObject sObj : sObjects) {
//            if (duplicateObjectsId.contains(sObj.Id)) {
//                objectsToDelete.add(sObj);
//            }
//        }
//        delete objectsToDelete;
//    }

//public class Refactor {
//    public static void func() {
//        List<Contact> allContacts = [SELECT LastName
//                                     FROM Contact];
//        Set<String> uniqueContacts = new Set<String>();
//        Map<String, Id> duplicateContacts = new Map<String, Id>();
//        for (Contact cont : allContacts) {
//            if (!uniqueContacts.add(cont.LastName)) {
//                duplicateContacts.put(cont.LastName, cont.Id);
//            }
//        }
//        List<Id> duplicateContactsId = duplicateContacts.values();
//        List<Contact> contactsToDelete = [SELECT LastName
//                                          FROM Contact
//                                          WHERE Id IN : duplicateContactsId];
//        delete contactsToDelete;
//
//        List<Lead> allLeads = [SELECT LastName
//                               FROM Lead];
//        Set<String> uniqueLeads = new Set<String>();
//        Map<String, Id> duplicateLeads = new Map<String, Id>();
//        for (Lead lead : allLeads) {
//            if (!uniqueLeads.add(lead.LastName)) {
//                duplicateLeads.put(lead.LastName, lead.Id);
//            }
//        }
//        List<Id> duplicateLeadsId = duplicateLeads.values();
//        List<Lead> leadsToDelete = [SELECT LastName
//                                    FROM Lead
//                                    WHERE Id IN : duplicateLeadsId];
//        delete leadsToDelete;
//    }
}