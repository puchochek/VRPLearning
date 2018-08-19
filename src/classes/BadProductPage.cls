public with sharing class BadProductPage {
    public List<Product__c> BadProduct{ get; set; }
    public String containsBad;
    public String containsWorst;
    public static String myMess { get; set;}

        public BadProductPage() {
        BadProduct = [
                SELECT Name, Bad_Substances__c, Worst_Substances__c
                FROM Product__c
        ];
    }

    public PageReference selectRow(){
        String someValue1 = ApexPages.currentPage().getParameters().get('P1');
        System.debug('You select the ' + someValue1);
        BadProductPage.findRecords(someValue1);
        return null;
    }

    public static void findRecords(String a) {
        System.debug('FindRowMethod works');
        String resolvedField1 = a;
        sObject sobjList = Database.query('SELECT Bad_Substances__c, Worst_Substances__c FROM Product__c WHERE Name = :resolvedField1');
        String containsBad = (String) sobjList.get('Bad_Substances__c');
        System.debug(containsBad);
        String containsWorst = (String) sobjList.get('Worst_Substances__c');
        System.debug(containsWorst);
        if ((containsBad == null)&&(containsWorst != null)) {
            myMess = resolvedField1 + ' contains ' + containsWorst;
        } else if ((containsBad != null)&&(containsWorst == null)) {
            myMess = resolvedField1 + ' contains ' + containsBad;
        } else if ((containsBad == null)&&(containsWorst == null)) {
            myMess = resolvedField1 + ' is clear from any E-substances';
        } else if ((containsBad != null)&&(containsWorst != null)) {
            List<String> fieldToComp1 = containsBad.split(',');
            System.debug(fieldToComp1);
            List<String> fieldToComp2 = containsWorst.split(',');
            System.debug(fieldToComp2);
            List<String> resList = new List<String>();
            for (String compString : fieldToComp1) {
                System.debug(compString);
                for (Integer i = 0; i < fieldToComp2.size(); i++) {
                    if (compString == fieldToComp2[i]) {
                        System.debug('this value is common ' + compString);
                        resList.add(compString);
                    }
                }
                myMess = resolvedField1 + ' contains both Bad and Worst substances' + resList;
            }
            System.debug(resList);
            //myMess = resolvedField1 + ' contains both Worst and Bad Substances';
        }
    }

}

//Used for compareing two fields with single value
//public static void findRecords(String a) {
//System.debug('FindRowMethod works');
//String resolvedField1 = a;
//sObject sobjList = Database.query('SELECT Bad_Substances__c, Worst_Substances__c FROM Product__c WHERE Name = :resolvedField1');
//String containsBad = (String) sobjList.get('Bad_Substances__c');
//System.debug(containsBad);
//String containsWorst = (String) sobjList.get('Worst_Substances__c');
//System.debug(containsWorst);
//if ((containsBad == null)&&(containsWorst != null)) {
//myMess = resolvedField1 + ' contains only Bad Substances';
//} else if ((containsBad != null)&&(containsWorst == null)) {
//myMess = resolvedField1 + ' contains only Worst Substances';
//} else if ((containsBad != null)&&(containsWorst != null)) {
//myMess = resolvedField1 + ' contains both Worst and Bad Substances';
//} else if ((containsBad == null)&&(containsWorst == null)) {
//myMess = resolvedField1 + ' is clear';
//}
//}




//Used for displaying fields
//    public BadProductPage() {
//        BadProduct = [
//                SELECT Bad_Substances__c, Worst_Substances__c
//                FROM Product__c
//        ];
//        System.debug(BadProduct);
//    }
//
//    public PageReference selectRow(){
//        String someValue1 = ApexPages.currentPage().getParameters().get('P1');
//        String someValue2 = ApexPages.currentPage().getParameters().get('P2');
//        String someValue3 = ApexPages.currentPage().getParameters().get('P3');
//        System.debug(someValue1 + ' ' + someValue2 + ' ' + someValue3);
//        return null;
//    }