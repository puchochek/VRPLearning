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
            if (myInt > min) {
                max = myInt;
            } else if (myInt < min) {
                min = myInt;
            }
        }
        thisStr = 'Min value is ' + min + ' Max value is ' + max;
        System.debug(thisStr);
        return thisStr;
    }

    public static void handleMap() {
        
    }
}