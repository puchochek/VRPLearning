/**
 * Created by User on 09.08.2018.
 */

public with sharing class AccountNumberTriggerHandler {

//    Написать триггер который, при обновлении Account.Account Number обновит все его Contacts поставив им в Description - ИмяЭтогоКонтакта+через пробел Account Name в скобках.
//    Также, если Account Number имеет длину менее 15 символов, заполнить до 15 символов нулями СЛЕВА. Если Account Number имеет длину более 15 символов обрезать до 15 символов СПРАВА.
//    12345 -> 000000000012345
//    123451234512345123 -> 123451234512345
//    (Это всё в одном триггере, за один раз и только при обновлении Account.Account Number)


    public static void updateContacts(List<Account> myOldAcc, List<Account> myNewAcc) {
        List<Contact> listToUodate = [
                SELECT Name, Description
                FROM Contact
                WHERE AccountId = :myNewAcc[0].Id
        ];

        if (myOldAcc[0].AccountNumber != myNewAcc[0].AccountNumber) {

            for (Contact contToChange : listToUodate) {
                contToChange.Description = contToChange.Name + ' ' + '(' + myNewAcc[0].Name + ')';
            }
        }
        update listToUodate;
        System.debug('Updated contacts ' + listToUodate);

        if (myNewAcc[0].AccountNumber.length() > 15) {
            String a = myNewAcc[0].AccountNumber;
            myNewAcc[0].AccountNumber = a.substring(0, 15);
            System.debug('New number ' + myNewAcc[0].AccountNumber);
        } else if (myNewAcc[0].AccountNumber.length() < 15) {
            String add = '';
            for (Integer i = 0; i < (15 - myNewAcc[0].AccountNumber.length()); i++) {
                add = add + '0';
            }
            String numb = add + myNewAcc[0].AccountNumber;
            System.debug('New number ' + numb);
            myNewAcc[0].AccountNumber = numb;
        }
    }


}