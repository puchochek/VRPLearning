/**
 * Created by Lena on 17.07.18.
 */

public with sharing class LoopsTaskClass {
//    public static List<Integer> forCount = new List<Integer>();
//    public static void createList() {
//        for (Integer i = 0; i <= 100; i++) {
//            forCount.add(i);
//        }
//        System.debug(forCount);
//    }
    public static void getMatrix() {

        String a = '';

        for (Integer i = 1; i <= 100; i++) {
            if (i < 10) {
                a = a + 0;
            }
            a = a + i + ' ';
            if (Math.mod(i, 10) == 0) {
                System.debug(a);
                a = '';
            }
        }
    }

    public static void getMatrixOne() {
        Integer dOne = 1;
        Integer dTwo = 10;
        String b = '';
        Integer j = 1;
        for (Integer i = 1; i<=100; i++) {
            if ((dOne == j) || (dTwo == j)) {
                b = b + ' ' + 1;
            } else {
                b = b + ' ' + 0;
            }
            j++;

            if (Math.mod(i, 10) == 0) {
                System.debug(b);
                b = '';
                dOne++;
                dTwo--;
                j = 1;
            }
        }


    }

}