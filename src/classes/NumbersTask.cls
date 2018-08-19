/**
 * Created by User on 08.08.2018.
 */

public with sharing class NumbersTask {
    public static Integer getRectangleArea(Integer width, Integer height) {
        Integer recArea = width*height;
        System.debug('Rec area is '+ recArea);
        return null;
    }

    public static Decimal getCicleCircumference(Decimal radius) {
        Decimal circ = radius*2*Math.PI;
        System.debug('Circumstemce is ' + circ);
        return null;
    }

    public static Double getAverage(Double value1, Double value2) {
        Double aver = (value1+value2)/2;
        System.debug('Average of two values is ' + aver);
        return null;
    }

    public static Decimal getDistanceBetweenPoints(Integer x1, Integer y1, Integer x2, Integer y2) {
        Integer a = x2 - x1;
        Integer b = y2 - y1;
        Double c = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2));
        System.debug('Distance between points is ' + c);
        return null;
    }

//    public static Integer getLinearEquationRoot(Integer a, Integer b) {
//        Integer c = -b / a;
//        System.debug('Linean Root is ' + c);
//        return null;
//    }
//
    public static Decimal getAngleBetweenVectors(Integer x1, Integer y1, Integer x2, Integer y2) {
        Integer a = y2 / x2;
        Integer b = y1 / x1;
        Double c = Math.abs(Math.atan(a) - Math.atan(b));
        System.debug('Angle between vectors is ' + c);
        return null;
    }

    public static Double parseNumberFromString(String value) {
        Integer a = integer.valueOf(value);
        System.debug('Integer value of string is ' + a);
        return null;
    }

    public static Decimal getParallelipidedDiagonal(Integer a, Integer b, Integer c) {
        Double x = Math.pow(a, 2) + Math.pow(b, 2) + Math.pow(c, 2);
        Double y = Math.sqrt(x);
        System.debug('Paralelepiped value is ' + y);
        return null;
    }

    public static Double roundToPowerOfTen(Double num, Double pow) {
        Double a = Math.pow(10, pow);
        Double b = Math.round(num / a) * a;
        System.debug('Rounded value is ' + a);
        return null;
    }
}