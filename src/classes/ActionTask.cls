/**
 * Created by User on 20.07.2018.
 */

public with sharing class ActionTask {
    String mesString;
    String objectName {get; set;}
//    public static List<sObject> sObj {get; set;}
    Account account;
    public Boolean isFirstBoxShownState;
    public Boolean isSecondBoxShownState;
    public Boolean isThirdBoxShownState;
    public String myParam {get;set;}

    public ActionTask(){
        //System.debug('constructor! ' + isShownState);
        isFirstBoxShownState = true;
        isSecondBoxShownState = true;
        isThirdBoxShownState = true;
    }

    public string getUser(){
        System.debug('getUser works');
        return mesString;
    }

    public boolean getIsFirstBoxShown(){
        System.debug('getIsShown works, isShownState = ' + isFirstBoxShownState);
        return isFirstBoxShownState;
    }

    public boolean getIsThirdBoxShown(){
        System.debug('getIsShown works, isShownState = ' + isThirdBoxShownState);
        return isThirdBoxShownState;
    }

    public boolean getIsSecondBoxShown(){
        System.debug('getIsShown works, isShownState = ' + isSecondBoxShownState);
        return isSecondBoxShownState;
    }

    public PageReference firstAction(){
        String someValue = ApexPages.currentPage().getParameters().get('FirstParam');
        mesString = 'You Pushed The ' + someValue;
        return null;
    }

    public PageReference secondAction(){
        String someValue = ApexPages.currentPage().getParameters().get('SecondParam');
        mesString = 'You Pushed The ' + someValue;
        return null;
    }

    public PageReference thirdAction(){
        String someValue = ApexPages.currentPage().getParameters().get('ThirdParam');
        mesString = 'You Pushed The ' + someValue;
        return null;
    }

    @RemoteAction
    public static List<sObject> getSObjects(String objectName){
        System.debug(objectName);

        String query = 'SELECT Id, Name, CreatedDate FROM ' + objectName + ' LIMIT 5';
        System.debug(query);

        List<sObject> sObjects = Database.query(query);
        System.debug(sObjects);

        return sObjects;
    }

    public PageReference redirectOne(){
        PageReference newPage = Page.PageForRefOne;
        newPage.setRedirect(true);
        return newPage;
    }

    public PageReference redirectTwo(){
        PageReference newPage = Page.PageForRedTwo;
        newPage.setRedirect(true);
        return newPage;
    }

    public PageReference redirectThree() {
        PageReference newPage = Page.PageForRedThree;
        newPage.setRedirect(true);
        return newPage;
    }

    public PageReference redirectExternalOne(){
        PageReference newPage = new PageReference('https://www.pluralsight.com');
        //newPage.setRedirect(true);
        return newPage;

    }

    public PageReference redirectExternalTwo(){
        PageReference newPage = new PageReference('https://vertex-academy.com');
        //newPage.setRedirect(true);
        return newPage;
    }

    public PageReference redirectExternalThree(){
        PageReference newPage = new PageReference('https://pikabu.ru/');
        //newPage.setRedirect(true);
        return newPage;
    }

    public Account getAccount(){
        if (account == null) {
            account = new Account();
        }
        return account;
    }

    public PageReference saveAndView(){
        insert account;
        PageReference newPage = new ApexPages.StandardController(account).view();
        newPage.setRedirect(true);
        return newPage;
    }

    public PageReference setParams(){
        PageReference page = page.ActionTask;
        page.getParameters().put('newParam', myParam);
        page.setRedirect(true);
        return page;
    }

    public void toggleFirstIsShown() {
        System.debug('togglePageBlock is working');
        isFirstBoxShownState = !isFirstBoxShownState;
        System.debug(isFirstBoxShownState);
    }

    public void toggleSecondIsShown() {
        System.debug('togglePageBlock is working');
        isSecondBoxShownState = !isSecondBoxShownState;
        System.debug(isSecondBoxShownState);
    }

    public void toggleThirdIsShown() {
        System.debug('togglePageBlock is working');
        isThirdBoxShownState = !isThirdBoxShownState;
        System.debug(isThirdBoxShownState);
    }
}