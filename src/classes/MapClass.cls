public class MapClass {

    public static void myMap() {
        Map<Id, Contact> myOMap = new Map<Id, Contact>();
        List<Contact> myList = [
                SELECT Id, Name, Email
                FROM Contact
                LIMIT 5
        ];
        Map<Integer, Map<Id, Contact>> smMap = new Map<Integer, Map<Id, Contact>>();
        for (Integer i = 0; i <= 5; i++) {
            smMap.put(i, myOMap);
        }
        System.debug(smMap.values());

        for (Contact cont : myList) {
            myOMap.put(cont.Id, cont);
        }

        for (Id idd : myOMap.keySet()) {
            //System.debug(idd + ' - ' + myMap.get(idd));
        }

        for (Contact idd : myOMap.values()) {
            //System.debug(idd + ' - ' + myMap.get(idd));
        }

        List<Contact> newList = [
                SELECT Phone
                FROM Contact
                WHERE AccountId = null
        ];
        List<Account> newAccList = [
                SELECT Phone
                FROM Account
        ];
        Map<String, Account> myNmap = new Map<String, Account>();
        System.debug(newList);
        System.debug(newAccList);
        for (Account acc : newAccList) {
            myNmap.put(acc.Phone, acc);
        }
        for (Contact cont : newList) {
            if (myNmap.get(cont.Phone) != null) {
                cont.AccountId = myNmap.get(cont.Phone).Id;
            }
            system.debug(myNmap.get(cont.Phone));
        }

        update newList;
        System.debug(newList);


        /*
       System.debug(myMap.keySet());
        Set<Id> newSet = myMap.keySet();
        for (Integer i = 0; i < myMap.keySet().size(); i++) {
            System.debug(myMap.getValue(newSet);
        }
        */
    }

    public static void someMap() {
        List<Contact> myList = [
                SELECT Name, Phone
                FROM Contact
                LIMIT 5
        ];
        Map<Id, String> myMap = new Map<Id, String>();
        for (Contact cont : myList) {
            myMap.put(cont.Id, cont.Name);
        }
        System.debug(myMap);
        Map<Integer, List<String>> myNewMap = new Map<Integer,List<String>>();
        for (Integer i = 0; i<5; i++){
            myNewMap.put(i, myMap.values());
        }
        System.debug(myNewMap);
        System.debug(myNewMap.values()[0].get(0));
         for (List<String> myStr : myNewMap.values()) {
             if (myStr.contains('Maxxx')) {
                 Integer ind = myStr.IndexOf('Maxxx');
                 String newMax = myStr.get(ind) + 'Shrimp';
                 System.debug(newMax);
             }



        }

    }
}