/**
 * Created by Lena on 11.07.18.
 */

public with sharing class EuguenTask {

    public static Integer compareMethod(Integer a, Integer b){
        Integer c = Math.min(a, b);
        System.debug(c);
        return c;
    }

    public static Boolean isDevideMethod(Integer a) {
        Boolean isDeviden = Math.mod(a, 2) == 0;
        System.debug(isDeviden);
        return isDeviden;
    }

    public static void calculeMethod(Integer a, Integer b, String operation){//what if string contains other symbols?? - need new logic!
        if (operation == '+') {
            System.debug(a + b);
        } else {
            if (operation == '-') {
                System.debug(a - b);
            } else {
                if (operation == '*') {
                    System.debug(a*b);
                } else {
                    if (operation == '/') {
                        System.debug(a/b);
                    }
                }
            }
        }

    }

    public static String countBeforePoint(String a) {
        Integer b = a.countMatches(' ');
        System.debug(a.substringBefore('.'));
        System.debug('There are ' + b + ' whitespaces.');
        return a.substringBefore('.');
        
    }
    
    public static String replaseByaka(String a) {
        System.debug(a.replaceAll('бяка', 'вырезано цензурой'));
        return a.replaceAll('бяка', 'вырезано цензурой');
    }

}