/**
 * Created by User on 13.08.2018.
 */

public with sharing class ExamTask {

    public static Integer findIndex(List<Integer> a, Integer b) {
        Integer ind = a.indexOf(b);
        System.debug(ind);
        return ind;
    }

    public static List<Integer> returnPos(List<Integer> posList) {
        List<Integer> posNumber = new List<Integer>();
        for (Integer pos :  posList) {
            if (pos>0) {
                posNumber.add(pos);
            }
        }
        System.debug(posNumber);
        return posNumber;
    }

    public static List<String> getUniqueString(List<String> someStr) {
        Set<String> unigueString = new Set<String>();
        List<String> myUniqueString = new List<String>();
        for (String myStr : someStr) {
            unigueString.add(myStr);
        }
        myUniqueString.addAll(unigueString);
        System.debug(myUniqueString);
        return myUniqueString;
    }
//
    public static List<Integer> getDoubleValue(List<Integer> doubleList) {//Why addAll doesn't work?
        List<Integer> listForDouble = new List<Integer>();
        for (Integer doubleInt : doubleList) {
            listForDouble.add(doubleInt);
            listForDouble.add(doubleInt);
        }
        System.debug(listForDouble);
        return listForDouble;
    }

    public static String getFizzBuzz(Integer intForMod) {
        String resultString;
        if ((Math.mod(intForMod, 3) == 0)&&(Math.mod(intForMod, 5) != 0)) {
            resultString = 'Fizz';
        } else {
            if ((Math.mod(intForMod, 5) == 0)&&(Math.mod(intForMod, 3) != 0)) {
                resultString = 'Buzz';
            } else {
                if ((Math.mod(intForMod, 3) == 0)&&(Math.mod(intForMod, 5) == 0)) {
                    resultString = 'FizzBuzz';
                } else {
                    resultString = String.valueOf(intForMod);
                }
            }
        }
        System.debug(resultString);
        return resultString;
    }

    
}