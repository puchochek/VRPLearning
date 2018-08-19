/**
 * Created by User on 09.08.2018.
 */

public with sharing class ContactDescriptionTriggerHandler {

//    3. Написать триггер и триггер-хелпер для Contact.
//    При изменении Description поля у Contact, изменять значение этого же поля у всех контактов, которые имеют тот же AccountId, на то же значение, что и обновляемого.
//    Избежать рекурсивного вызова триггера.
//    Работа с bulk-операциями (принцип - если пришло в триггер 2 и более Contact, брать значение из первого пришедшего)
//
    public static Boolean isTriggerExecuted;
//
    public static void changeContDescription(List<Contact> oldCont, List<Contact> newCont) {
        //System.debug('Contact was changed');
        List<Contact> contforUpdate = [
                SELECT Name, Description
                FROM Contact
                WHERE AccountId = :newCont[0].AccountId
        ];
        if (oldCont[0].Description != newCont[0].Description) {
            //System.debug('Description was changed');
            //System.debug('Contacts for update ' + contforUpdate);
            for (Contact contToUpd : contforUpdate) {
                contToUpd.Description = newCont[0].Description;
            }
        }
        update contforUpdate;
        System.debug('Updated contacts are ' + contforUpdate);

    }
}