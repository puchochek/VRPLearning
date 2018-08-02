public class MediaTriggerHandler {

    public static Id createDefault() {
        Contact defaultCont = new Contact();
        defaultCont.LastName = 'Default';
        insert defaultCont;
        return defaultCont.Id;
    }

    public static void setLookup(List<Media__c> newMedia) {
        if (newMedia[0].Contact__c == null) {
            List<Contact> ifDefault = [
                    SELECT Name
                    FROM Contact
                    WHERE Name = 'Default'
            ];

            if (ifDefault.size() == 0) {
                Id myId = MediaTriggerHandler.createDefault();
                newMedia[0].Contact__c = myId;
            } else {
                newMedia[0].Contact__c = ifDefault[0].Id;
            }

            System.debug(newMedia[0].Contact__c);
        }
    }
}