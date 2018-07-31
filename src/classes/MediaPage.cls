/**
 * Created by User on 31.07.2018.
 */

public with sharing class MediaPage {
    Media__c media;

    public Media__c getMedia(){
        if (media == null) {
            media = new Media__c();
        }

        return media;
    }
    public PageReference saveMedia(){
        insert media;
        PageReference newPage = new pagereference('/apex/MediaPage');
        newPage.setRedirect(true);
        return newPage;
    }
//
}