public class MapClass {

    public static void myMap() {
        Map<Id, Contact> myMap = new Map<Id, Contact>();
        List<Contact> myList = [
            SELECT Id, Name, Email
            FROM Contact
            LIMIT 5
        ];
        System.debug(myList);
           
        for (Contact cont : myList) {            
           myMap.put(cont.Id, cont);
        }
        
        for (Id idd: myMap.keySet()) {
            System.debug(idd + ' - ' + myMap.get(idd));
        }
        
        for (Contact idd: myMap.values()) {
            //System.debug(idd + ' - ' + myMap.get(idd));
        }

        
        /*
       System.debug(myMap.keySet());
        Set<Id> newSet = myMap.keySet();
        for (Integer i = 0; i < myMap.keySet().size(); i++) {
            System.debug(myMap.getValue(newSet);
        }
        */
    }
}