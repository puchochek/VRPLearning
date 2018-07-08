public class Rectangle {
    Integer sideA, sideB;

    public void setData(Integer a, Integer b) {
        sideA = a;
        sideB = b;
    }

    public Integer getPerimetr() {

        if (sideA == null || sideB == null) {
            System.debug('You have to set the value');
            return 0;
        } else {
            Integer perimetr = sideA * 2 + sideB * 2;
            return perimetr;
        }
    }
    public Integer getSquare() {

        if (sideA == null || sideB == null) {
            System.debug('You have to set the value');
            return 0;
        } else {
            Integer sqr = sideA * sideB;
            return sqr;
        }

    }

}