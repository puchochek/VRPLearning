/**
 * Created by Lena on 08.07.18.
 */

public with sharing class DisplayUserInfo {
    public User currentuser {get;set;}
    public String currentuserMail {get;set;}
    public String currentuserCurrency {get;set;}
    public String currentuserOrg {get;set;}
    public Integer limitSOQL {get;set;}
    public Date currentDate {get;set;}

    public DisplayUserInfo() {
        currentuser = [SELECT Id, Name, SenderEmail FROM User WHERE Id = : UserInfo.getuserId()];
        //currentuserMail = [SELECT Email SenderEmail FROM User WHERE Email = : UserInfo.getUserEmail()];
        currentuserMail = UserInfo.getUserEmail();
        currentuserCurrency = UserInfo.getDefaultCurrency();
        currentuserOrg = UserInfo.getOrganizationName();
        limitSOQL = Limits.getLimitQueries();
        currentDate = date.today();
    }



}