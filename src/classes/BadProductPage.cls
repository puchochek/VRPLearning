

public with sharing class BadProductPage {
    public List<Product__c> BadProduct{ get; set; }

    public BadProductPage() {
        BadProduct = [
                SELECT Bad_Substances__c, Worst_Substances__c
                FROM Product__c
        ];
        System.debug(BadProduct);
    }

    public PageReference selectRow(){
        String someValue1 = ApexPages.currentPage().getParameters().get('P1');
        String someValue2 = ApexPages.currentPage().getParameters().get('P2');
        String someValue3 = ApexPages.currentPage().getParameters().get('P3');
        System.debug(someValue1 + ' ' + someValue2 + ' ' + someValue3);
        return null;
    }
}