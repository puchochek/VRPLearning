/**
 * Created by User on 01.08.2018.
 */

public with sharing class TestTask01 {

    public static String handleString(String a) {
        String myStr;
        if (a.length() > 5) {
            myStr = a.substring(0, 3);
        } else {
        String b = '';
            for (Integer i = 0; i < (5-a.length()); i++) {
                b = b + '*';
            }
            myStr = a + b;
        }
        System.debug(myStr);
        return myStr;
    }

    public static Integer multList(List<Integer> myList) {
        Integer res = myList[0];
        for (Integer countList : myList) {
            res = res*countList;
        }
        System.debug(res);
        return res;
    }

    public static String maxminList(List<Integer> myList) {
        String res;
        myList.sort();
        Integer i = myList.size();
        res = 'Min value is ' + String.valueOf(myList[0]) + ' Max value is ' + String.valueOf(myList[i-1]);
        System.debug(res);
        return res;
    }

    public static String compList(List<Integer> thisList) {
        String thisStr;
        Integer min = thisList[0];
        Integer max = thisList[0];
        for (Integer myInt : thisList) {
            if (myInt > max) {
                max = myInt;
            } else if (myInt < min) {
                min = myInt;
            }
        }
        thisStr = 'Min value is ' + min + ' Max value is ' + max;
        System.debug(thisStr);
        return thisStr;
    }

    public static void createIntList() {
        List<Integer> myList = new List<Integer>();
        for(Integer i = 0; i <10; i++) {
            Double a = Math.random()*10;
            Integer inte = Math.round(a);
            myList.add(inte);
        }
        System.debug('Start list ' + myList);
        List<Integer> fakeList = myList.clone();

        List<Integer> listToShake = new List<Integer>();

           while (fakeList.size() > 0) {
               Integer ind = Integer.valueOf(Math.floor(Math.random() * fakeList.size()));
               listToShake.add(fakeList[ind]);
               fakeList.remove(ind);
           }

        myList.clear();
        myList.addAll(listToShake);
        System.debug('End list ' + myList);
    }

    /*Написать метод который будет принимать List<Account> на входе и возвращать
            Map<AccountName, List<связанных объектов(Contact)>>*/

//    public static  Map<String, List<Contact>> findMapMethod(List<Account> myAcc) {
//        Map<String, List<Contact>> myMap = new Map<String, List<Contact>>();
//        System.debug('Start List ' + myAcc);
//
//        for (Integer i = 0; i < myAcc.size(); i++) {
//            List<Contact> myCont = [
//                    SELECT Name
//                    FROM Contact
//                    WHERE Account.Name = :myAcc[i].Name
//            ];
//            myMap.put(myAcc[i].Name, myCont);
//        }
//        System.debug('End Map ' + myMap);
//    return myMap;
//    }
//

    public static Map<String, List<Contact>> findMapSecMethod(List<Account> accToCompare){
        Map<String, List<Contact>> myMap = new Map<String, List<Contact>>();
        for(Account acc : accToCompare) {
            if (myMap.keyset().contains(acc.Name)){
                myMap.get(acc.Name).add(acc.Contacts);
                //Object a = myMap.get(acc.Name).add(acc.Contacts);
                //System.debug(a);
            } else {
                myMap.put(acc.Name, acc.Contacts);
            }
        }
        System.debug(myMap);
        return myMap;
    }
//
    public static void countFibonaccy(Integer endNum) {
        List<Integer> fibNumbers = new List<Integer>();
        Integer nextNum;
        Integer firstNum = 0;
        Integer secondNum = 1;
        fibNumbers.add(firstNum);
        fibNumbers.add(secondNum);
        for (Integer i = 0; i < endNum; i++) {
            nextNum = firstNum + secondNum;
            fibNumbers.add(nextNum);
            firstNum = secondNum;
            secondNum = nextNum;
        }
        System.debug(fibNumbers);
    }

//    Получить все контакты отсортированных по дате создания(возрастанию) у которых LastName
//    начинается или заканичивается на букву 'A'.
//            Если у какого-то из контактов FirstName содержит подстроку 'boss', то добавить к ней "big ",
//            чтобы получилось например: было "My boss" -> "My big boss"

    public static void getAContacts() {
        List<Contact> aContactList = [
                SELECT FirstName, LastName
                FROM Contact
                WHERE LastName LIKE 'A%' OR LastName LIKE '%A'
                ORDER BY CreatedDate asc
        ];
        System.debug(aContactList);

        for (Contact bossCont : aContactList) {
            if (bossCont.FirstName.contains('boss')) {
                bossCont.FirstName = bossCont.FirstName.replace('boss', 'big boss');
                System.debug(bossCont.FirstName + ' ' + bossCont.LastName);
            }

        }
        update aContactList;
    }

    public static void createSomeObj(String objName, List<String> objFields, List<String> objRecords) {
        Map<String,Schema.SObjectField> validateField = Schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();
        List<String> checedString = new List<String>();
        try {
            for (Integer i = 0; i < objFields.size(); i++) {
                checedString.add(String.valueOf(validateField.get(objFields[i])));
            }
        } catch (NullPointerException e) {
            System.debug('Exception ' + e.getMessage());
        }

        System.debug(checedString);
        sObject obj = Schema.getGlobalDescribe().get(objName).newSObject();
        System.debug(obj);
        try {
            for (Integer i = 0; i < objFields.size(); i++) {
                obj.put(checedString[i], objRecords[i]);
            }
        } catch (NullPointerException e) {
        System.debug('Exception ' + e.getMessage());
    }
            Database.SaveResult res = Database.insert(obj, false);
            if (res.isSuccess()) {
                System.debug('Object was successfully inserted');
            } else {
                System.debug('Something is wrong');
            }
System.debug(obj);
    }

}