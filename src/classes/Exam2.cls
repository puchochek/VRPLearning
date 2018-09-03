public class Exam2 {
    
    public static List<Integer> returnNumber(Integer a) {
        List<Integer> ifMultyply2 = new List<Integer>(0);
        for (Integer i = 0; i <= a; i++) {
            Integer rand = Integer.valueOf(Math.random()*10);
            if ((Math.mod(rand, 2) != 0)&&(a != 0)) {
				ifMultyply2.add(rand);                
            }
        }
        System.debug(ifMultyply2);
        return ifMultyply2;                                             
    }
    
    public static List<String> isContains(List<String> startList, String startString) {
        List<String> endList = new List<String>();
        for (String a : startList) {
            if (a.contains(startString)) {
                endList.add(a);
            }
        }
        System.debug(endList);
        return endList;
    }
    
    public static List<sObject> returnN(List<sObject> startList, Integer startInt) {
        List<sObject> endList = new List<sObject>();
        for (Integer i = 0; i < startInt; i++) {
            endList.add(startList[i]);
        }
        System.debug(endList);
        return endList;
    }
    
    public static List<Integer> returnSec(List<Integer> startList)  {
        List<Integer> endList = new List<Integer>();
        for (Integer i = 1; i <= startList.size(); i++) {
            if ((Math.mod(i, 2) != 0)) {
                endList.add(startList[i]);
            }
        }
        System.debug(endList);
        return endList;
    }
    
    public static List<Integer> returnBiggest(List<Integer> startList)  {
        List<Integer> endList = new List<Integer>();
        startList.sort();
        Integer lastInd = startList.size();
        endList.add(startList[lastInd - 1]);
        endList.add(startList[lastInd - 2]);
        endList.add(startList[lastInd - 3]);
        System.debug(endList);
        return endList;
    }
    
    public static Integer returnSum(Integer startInt) {
        String intStr = String.valueOf(startInt);
        List<String> getNumbers = intStr.split('');
        Integer tempPos = 0;
        Integer sum;
        for (Integer i = 0; i < getNumbers.size(); i++) {
            sum = tempPos + Integer.valueOf(getNumbers[i]);
            tempPos = sum; 
        }
        
        if (sum > 9) {
        	String secItn = String.valueOf(sum);
        	List<String> getNumbersSec = secItn.split('');
        	Integer tempPosSec = 0;
        	for (Integer i = 0; i < getNumbersSec.size(); i++) {
        		sum = tempPosSec + Integer.valueOf(getNumbersSec[i]);
        		tempPosSec = sum; 
        	}
        }
        System.debug(sum);
        return sum;
    }
}