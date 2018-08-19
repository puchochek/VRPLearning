@IsTest
public with sharing class ExamTasksTest {
//    1.a
    @IsTest
    public static void findIndexTest() {
        List<String> arrayArg = new List<String>{
                'zero',
                'one',
                'two',
                'three',
                'four',
                'five',
                'six',
                'seven',
                'eight',
                'nine'
        };

        System.assertEquals(0, ExamTasks.findIndex(arrayArg, 'zero'));
        System.assertEquals(1, ExamTasks.findIndex(arrayArg, 'one'));
        System.assertEquals(2, ExamTasks.findIndex(arrayArg, 'two'));
        System.assertEquals(3, ExamTasks.findIndex(arrayArg, 'three'));
        System.assertEquals(4, ExamTasks.findIndex(arrayArg, 'four'));
        System.assertEquals(-1, ExamTasks.findIndex(arrayArg, 'asd'));
    }

//    1.b
    @IsTest
    public static void filterNegativeNumbersTest() {
        List<Integer> arrayArg1 = new List<Integer>{-1,2,4,-5,2};
        List<Integer> arrayArg2 = new List<Integer>{0,0,0,0,0};
        List<Integer> arrayArg3 = new List<Integer>{-1,-2,-4,-5,-2};

        System.assertEquals(3, ExamTasks.filterNegativeNumbers(arrayArg1).size());
        System.assertEquals(5, ExamTasks.filterNegativeNumbers(arrayArg2).size());
        System.assertEquals(0, ExamTasks.filterNegativeNumbers(arrayArg3).size());
    }

//    1.c
    @IsTest
    public static void filterDuplicatesTest() {
        List<String> arrayArg1 = new List<String>{'1', '1', '2', '2', '3'};
        List<String> arrayArg2 = new List<String>{'1', '2', '3', '4', '4'};
        List<String> arrayArg3 = new List<String>{'1', '2', '3', '4', '5'};

        System.assertEquals(3, ExamTasks.filterDuplicates(arrayArg1).size());
        System.assertEquals(4, ExamTasks.filterDuplicates(arrayArg2).size());
        System.assertEquals(5, ExamTasks.filterDuplicates(arrayArg3).size());
    }

//    1.d
    @IsTest
    public static void duplicateArrayItemsTest() {
        List<Integer> arrayArg1 = new List<Integer>();
        List<Integer> arrayArg2 = new List<Integer>{1,2,3};
        List<Integer> arrayArg3 = new List<Integer>{1,2,3,4,5,6,7,8,9,0};

        System.assertEquals(0, ExamTasks.duplicateArrayItems(arrayArg1).size());
        System.assertEquals(6, ExamTasks.duplicateArrayItems(arrayArg2).size());
        System.assertEquals(20, ExamTasks.duplicateArrayItems(arrayArg3).size());
    }

//    1.e
    @IsTest
    public static void getFactorialTest() {
        System.assertEquals(6, ExamTasks.getFactorial(3));
        System.assertEquals(120, ExamTasks.getFactorial(5));
        System.assertEquals(3628800, ExamTasks.getFactorial(10));
    }

//    1.f
    @IsTest
    public static void fizzBuzzTest() {
        System.assertEquals('2', ExamTasks.fizzBuzz(2));
        System.assertEquals('0', ExamTasks.fizzBuzz(0));
        System.assertEquals('Fizz', ExamTasks.fizzBuzz(6));
        System.assertEquals('Buzz', ExamTasks.fizzBuzz(10));
        System.assertEquals('FizzBuzz', ExamTasks.fizzBuzz(15));
    }

//    1.g
    @IsTest
    public static void sortArrayOfNumbersTest() {
        List<String> arrayArg1          = new List<String>{'one', 'zero', 'two'};
        List<String> arrayArg1Sorted    = new List<String>{'zero', 'one', 'two'};

        List<String> arrayArg2          = new List<String>{'one', 'zero', 'zero'};
        List<String> arrayArg2Sorted    = new List<String>{'zero', 'zero', 'one'};

        List<String> arrayArg3          = new List<String>{'one', 'zero', 'nine', 'seven', 'nine'};
        List<String> arrayArg3Sorted    = new List<String>{'zero', 'one', 'seven', 'nine', 'nine'};

        List<String> arrayArg4          = new List<String>();
        List<String> arrayArg4Sorted    = new List<String>();

        System.assertEquals(true, ExamTasks.sortArrayOfNumbers(arrayArg1).equals(arrayArg1Sorted));
        System.assertEquals(true, ExamTasks.sortArrayOfNumbers(arrayArg2).equals(arrayArg2Sorted));
        System.assertEquals(true, ExamTasks.sortArrayOfNumbers(arrayArg3).equals(arrayArg3Sorted));
        System.assertEquals(true, ExamTasks.sortArrayOfNumbers(arrayArg4).equals(arrayArg4Sorted));
    }

//    2.a
    @IsTest
    public static void deleteContactsByNameTest() {
        List<Contact> contacts = new List<Contact>{
                new Contact(LastName = 'last1'),
                new Contact(LastName = 'last2'),
                new Contact(LastName = 'last3'),
                new Contact(LastName = 'last4'),
                new Contact(LastName = 'test')
        };
        insert contacts;

        Test.startTest();
        ExamTasks.deleteContactsByName('last');
        System.assertEquals(1, [SELECT Id FROM Contact].size());
        Test.stopTest();
    }

//    2.b
    @IsTest
    public static void deleteSObjectsByNameTest() {
        List<Contact> contacts = new List<Contact>{
                new Contact(LastName = 'last'),
                new Contact(LastName = 'last'),
                new Contact(LastName = 'last'),
                new Contact(LastName = 'last'),
                new Contact(LastName = 'test')
        };
        insert contacts;

        Test.startTest();
        ExamTasks.deleteSObjectsByName('Contact', 'last');
        System.assertEquals(1, [SELECT Id FROM Contact].size());
        Test.stopTest();
    }

//    2.c
    @IsTest
    public static void deleteSObjectDuplicatesByNameTest() {
        List<Contact> contacts = new List<Contact>{
                new Contact(LastName = 'last'),
                new Contact(LastName = 'last'),
                new Contact(LastName = 'last'),
                new Contact(LastName = 'last'),
                new Contact(LastName = 'test')
        };
        insert contacts;

        Test.startTest();
        ExamTasks.deleteSObjectDuplicatesByName('Contact', 'last');
        System.assertEquals(1, [SELECT Id FROM Contact WHERE LastName = 'last'].size());
        Test.stopTest();
    }

//    3.a
    @IsTest
    public static void get10OpportunitiesTest() {
        List<Opportunity> opportunities = new List<Opportunity>();

        for (Integer count = 0; count < 10; count++) {
            opportunities.add(new Opportunity(
                    Name        = count + 'TestName',
                    StageName   = 'Closed Lost',
                    CloseDate   = Date.today()
            ));
        }
        insert opportunities;

        Test.startTest();

        System.assertEquals(10, [
                SELECT Id, Name
                FROM Opportunity
                ORDER BY Name DESC
        ].size());
        Test.stopTest();
    }

//    3.b
    @IsTest
    public static void createMapFromOpportunitiesTest() {
        List<Opportunity> opportunities = new List<Opportunity>();

        for (Integer count = 0; count < 7; count++) {
            opportunities.add(new Opportunity(
                    Name        = 'niteTest' + count,
                    StageName   = 'Closed Lost',
                    CloseDate   = Date.today()
            ));
        }
        insert opportunities;

        Test.startTest();
        Map<String, String> stringMap = ExamTasks.createMapFromOpportunities();
        System.assertEquals(7, stringMap.size());
        Test.stopTest();
    }

//    3.c
    @IsTest
    public static void changeOppAmountToZeroTest() {
        List<Opportunity> opportunities = new List<Opportunity>();

        for (Integer count = 0; count < 3; count++) {
            opportunities.add(new Opportunity(
                    Name        = 'niverTest' + count,
                    StageName   = 'Closed Lost',
                    CloseDate   = Date.today()
            ));
        }
        insert opportunities;

        Test.startTest();
        ExamTasks.changeOppAmountToZero();
        System.assertEquals(0, [SELECT Id, Amount FROM Opportunity WHERE Name LIKE '%niver%'].get(0).Amount);
        Test.stopTest();
    }
}