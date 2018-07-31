public class MediaTriggerHandler {

    
    public static void setLookup(List<Media__c> newMedia) {
        Contact defaultCont = new Contact();
        defaultCont.LastName = 'Default';
        insert defaultCont;
        System.debug(newMedia);
        System.debug('Trigger fired');
        System.debug(newMedia[0].Contact__c);
        System.debug(defaultCont);
        if (newMedia[0].Contact__c == null) {
            newMedia[0].Contact__c = defaultCont.Id;
    }
        System.debug(newMedia[0].Contact__c);
        //update newMedia;

    }
}