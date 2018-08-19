public with sharing class ExamTasks {
/*  1.aМетод принимает 2 аргумента, массив строк и строку. Вернуть индекс
элемента массива, который равен второму аргументу или -1, если
совпадений нет (+1 балл) */
    public static Integer findIndex(List<String> arrayArg, String searchItem) {
        Integer resIndex = arrayArg.indexOf(searchItem);
            //System.debug(resIndex);
        return resIndex;
    }

/*    1.b Метод принимает массив чисел, убирает из него все отрицательные
числа и возвращает новый массив состоящий из оставшихся чисел (+1
балл)*/
    public static List<Integer> filterNegativeNumbers(List<Integer> arrayArg) {
        List<Integer> posNumber = new List<Integer>();
        for (Integer pos :  arrayArg) {
            if (pos>=0) {
                posNumber.add(pos);
            }
        }
        System.debug(posNumber);
        return posNumber;
    }

//    1.cМетод принимает массив строк, пробегает по массиву и формирует
//новый, без повторяющихся значений 
    public static List<String> filterDuplicates(List<String> arrayArg) {
        Set<String> unigueString = new Set<String>();
        List<String> myUniqueString = new List<String>();
        for (String myStr : arrayArg) {
            unigueString.add(myStr);
        }
        myUniqueString.addAll(unigueString);
        System.debug(myUniqueString);
        return myUniqueString;
    }

//    1.dМетод принимает массив чисел и возвращает массив этих чисел
//повторенных дважды (+1 балл)
    public static List<Integer> duplicateArrayItems(List<Integer> arrayArg) {
        List<Integer> listForDouble = new List<Integer>();
        for (Integer doubleInt : arrayArg) {
            listForDouble.add(doubleInt);
            listForDouble.add(doubleInt);
        }
        System.debug(listForDouble);
        return listForDouble;
    }

/*   1.eМетод принимает число и возвращает его факториал(* произведение
всех чисgел, от 1 до n включительно, с инкрементом 1, N*(N+1)*(N+2)….)
(+2 балла)*/
    
    public static Integer getFactorial(Integer value) {
        Integer fact = 1; 
        for (Integer i = 1; i <= value; i++){
            fact = fact*i;     
        }
        System.debug(fact);
        return fact;
    }

/*    1.f   Метод принимает число и возвращает ‘Fizz’, ‘Buzz’ строку или
оригинальное число в строковом представлении используя следующие
правила (+2 балл):Вернуть оригинальное число
■ Но если число кратно 3, вернуть Fizz
■ Но если число кратно 5, вернуть Buzz
■ Но если кратно 3 и 5, вернуть FizzBuzz*/
    public static String fizzBuzz(Integer value) {
        String resultString;
        //if ((Math.mod(value, 3) == 0)&&(Math.mod(value, 5) == 0)) {
        if ((Math.mod(value, 15) == 0)&&(value != 0)){
        resultString = 'FizzBuzz';
            } else { 
                if ((Math.mod(value, 3) == 0)&&(Math.mod(value, 5) != 0)) {
                resultString = 'Fizz';
                } else {
                    if ((Math.mod(value, 5) == 0)&&(Math.mod(value, 3) != 0)) {
                        resultString = 'Buzz';
                    } else {
                        resultString = String.valueOf(value);
                    }
                }
            }
        System.debug(resultString);
        return resultString;
    }

//
//    List<String> arrayArg = new List<String>{
//            'zero',
//            'one',
//            'two',
//            'three',
//            'four',
//            'five',
//            'six',
//            'seven',
//            'eight',
//            'nine'
//    };
/*    1.gМетод принимает массив из чисел в виде строки([‘one’, ‘two’, ‘three’...]), от
1 до 9 и сортирует его по возрастанию (+2 балл)*/
    public static List<String> sortArrayOfNumbers(List<String> arrayArg) {
       System.debug(arrayArg);
      //List<String> myArrayArg = new List<String>();
      Map<String, Integer> mapToInt = new Map<String, Integer>();
          mapToInt.put('zero', 0);
          mapToInt.put('one', 1);
          mapToInt.put('two', 2);
          mapToInt.put('three', 3);
          mapToInt.put('four', 4);
          mapToInt.put('five', 5);
          mapToInt.put('six', 6);
          mapToInt.put('seven', 7);
          mapToInt.put('eight', 8);
          mapToInt.put('nine', 9);
        
        for (Integer i = 0; i < arrayArg.size()-1; i++) {
    		for (Integer j= i + 1; j < arrayArg.size(); j++) {
        		Integer val1 = mapToInt.get(arrayArg[i]);
                //System.debug(val1);
        		Integer val2 = mapToInt.get(arrayArg[j]);
                //System.debug(val2);
        			if (val1 > val2) {
            			String tempValue = arrayArg[i];
                        //System.debug(res);
            			arrayArg[i] = arrayArg[j];
                        System.debug(arrayArg[i]);
            			arrayArg[j] = tempValue; 
                        System.debug(arrayArg[j]);
        			}
                //myArrayArg.add(res);
    		}
            
		}
        
        System.debug(arrayArg);
        return arrayArg;
    }

//    2.a
    public static void deleteContactsByName(String searchString) {
        String selectedContact ='\'%' + searchString  + '%\'';
        List<sObject> contForDel = Database.query('SELECT LastName FROM Contact WHERE LastName LIKE ' + selectedContact);
        System.debug(contForDel);
        delete contForDel;             
    }

//    2.b
    public static void deleteSObjectsByName(String sObjectName ,String searchString) {
        String selectedContact ='\'%' + searchString  + '%\'';
        //System.debug(selectedContact);
        List<sObject> myList = Database.query('SELECT LastName, Id FROM ' + sObjectName + ' WHERE LastName LIKE ' + selectedContact);
        System.debug(myList);
   
        delete myList;
    }

//    2.c
//     High level: метод должен принимать первым аргументом API name объекта, вторым строку 
//     и оставлять только 1-у запись содержащую в своем имени строку из второго аргумента (+3 балла) 
    public static void deleteSObjectDuplicatesByName(String sObjectName ,String searchString) { 
        String selectedContact ='\'%' + searchString  + '%\'';
        //System.debug(selectedContact);
        List<sObject> myList = Database.query('SELECT LastName, Id FROM ' + sObjectName + ' WHERE LastName LIKE ' + selectedContact);
        System.debug(myList);
       	myList.remove(0);
        delete myList;
        //Database.insert(listToInsert, true);
        //Database.delete(myList, true);
        
        //System.debug(myList);
    }

// 3.a
    public static List<Opportunity> get10Opportunities() {
        List<Opportunity> tenOpp = [
            SELECT Name
            FROM Opportunity
            ORDER BY Name Desc
        ];
        return null;
    }

// 3.b
    public static Map<String, String> createMapFromOpportunities() {
        List<Opportunity> oppForMap = [
            SELECT Name, Account.Name
            FROM Opportunity 
            WHERE Name LIKE '%nite%'
        ];
        System.debug(oppForMap);
        Map<String, String> oppMap = new Map<String, String>();
        for (Opportunity myOpp : oppForMap) {
            oppMap.put(myOpp.Name, myOpp.Account.Name);
        }
        System.debug(oppMap);
        System.debug(oppMap.size());
        return oppMap;
    }

// 3.cHigh level: для Opportunity у которых в имени(поле Name) есть “niver”
//обнулить поле Amount в базе данных (+6 баллов)

    public static void changeOppAmountToZero() {
        List<Opportunity> oppToChangeAmount = [
            SELECT Name, Amount
            FROM Opportunity
            WHERE Name LIKE '%niver' OR Name LIKE 'niver%'
        ];
        for (Opportunity opp : oppToChangeAmount) {
            opp.Amount = 0;
        }
        update oppToChangeAmount;
        System.debug(oppToChangeAmount);
    }

}