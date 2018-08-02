/**
 * Created by User on 31.07.2018.
 */

public with sharing class MediaContactPage {
    public List<selectOption> options{get;set;}
    public String myValue{get;set;}
    public List<Media__c> mediaList{get;set;}


    public  MediaContactPage() {
        options = new List<selectOption>();
        options.add( new SelectOption('','--Select--'));
            for(Contact cont : [select Id, name from Contact ] ) {
                options.add(new SelectOption(cont.Id,cont.name));
                System.debug(cont);
            }
        System.debug(options);
    }

    //public PageReference showMedia(){
        //mediaList=[select name, type, url from Media__c where Contact__c=: selectedContId];
        //return null;
    //}

    public void findLabel() {
        for (SelectOption so : options) {
            if (so.getValue() == myValue) {
                myValue = so.getLabel();
                System.debug(myValue);
            }
        }
    }

    public PageReference showMedia(){
        //mediaList=[select name, type, url from Media__c where Contact__c=: selectedContId];
        return null;
    }

}