public class TestTriggerHandler {

    public static void addPrefix(List<Contact> myList, List<Contact> myOldList) {
        
        for (Contact newCont : myList) {
            for (Contact oldCont : myOldList) {
                if (oldCont.LastName != newCont.LastName) {
        	newCont.LastName = newCont.LastName + ' somepostfics';
                }
            }
        }
        //update myList;
        
    }
}