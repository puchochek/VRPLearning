@RestResource(UrlMapping='/test/*')

global with sharing class RESTservice {

    public static DateTime valideTime;
    @HttpGet
    global static String getContacts() {
        RestResponse res = RestContext.response;
        RestRequest req = RestContext.request;
        //System.debug(req);
        String getNameFromURI = req.requestURI.substring(6);
        //System.debug(getNameFromURI);
        List<Guest__c> guestByReqwest = new List<Guest__c>();
        String response;

        if (getNameFromURI == '') {
            guestByReqwest = [
                    SELECT Name
                    FROM Guest__c
            ];
            response = 'All the guests are ' + guestByReqwest;
        } else {
            if (getNameFromURI.startsWith('C-')) {
                guestByReqwest = [
                        SELECT Name
                        FROM Guest__c
                        WHERE Name = :getNameFromURI
                ];
                response = 'The contact is found ' + guestByReqwest;
            } else {
                if (getNameFromURI == 'false') {
                    guestByReqwest = [
                            SELECT Name
                            FROM Guest__c
                            WHERE Is_Invited__c = false
                    ];
                    //System.debug(guestByReqwest);
                    response = 'There are uninvited guests ' + guestByReqwest;
                } else {

                    response = 'Please, check the input.';
                }
            }
        }
        return response;
    }
    @HttpPut
    global static String inviteGuestByName(List<String> contacts) {

        RestRequest req = RestContext.request;
        String secretKey = req.headers.get('Key');

        if (!RESTservice.checkKey(secretKey)) {
            return 'Wrong key';
        }

        String RESTresponse;
        Set<String> uniqueContacts = new Set<String>();
        Set<String> duplicateContacts = new Set<String>();
        List<Contact> contactsToInsert = new List<Contact>();
        List<Guest__c> guestsToInvite = new List<Guest__c>();


        if (contacts[0].startsWith('003')&&((contacts[0].length() == 15)||(contacts[0].length() == 18))) {
            Guest__c newInvitedGuest = new Guest__c(Is_Invited__c = true, Contact__c = contacts[0]);
            guestsToInvite.add(newInvitedGuest);
            insert guestsToInvite;
            RESTresponse = 'This guest ' + guestsToInvite + ' is invited';
        } else {
            List<Contact> existedContacts = [
                    SELECT Name
                    FROM Contact
                    WHERE Name IN :contacts
            ];

            for (Contact contactName : existedContacts) {
                if (!uniqueContacts.add(contactName.Name)) {
                    duplicateContacts .add(contactName.Name);
                }
            }

            if (duplicateContacts.isEmpty()) {
                for (String reqwestedContact : contacts) {
                    if (uniqueContacts.contains(reqwestedContact)) {
                        System.debug(reqwestedContact + ' exist');
                    } else {
                        System.debug(reqwestedContact + ' is not exist. Let\'s create it.');
                        Contact newCont = new Contact(LastName = reqwestedContact);
                        contactsToInsert.add(newCont);
                    }
                }
                insert contactsToInsert;

                List<Contact> newExistedContacts = [
                        SELECT Name, Id
                        FROM Contact
                        WHERE Name IN :contacts
                ];

                for (Contact invitedContact : newExistedContacts) {
                    Integer randomIndex = Integer.valueOf(Math.floor(Math.random()) * newExistedContacts.size());
                    Guest__c newInvitedGuest = new Guest__c(Is_Invited__c = true, Contact__c = newExistedContacts[randomIndex].Id);
                    guestsToInvite.add(newInvitedGuest);
                }
                insert guestsToInvite;
                RESTresponse = guestsToInvite.size() + ' guests are invited';
            } else {
                RESTresponse = 'This contacts ' + duplicateContacts + ' have duplicate values. Please, enter the Id to identificate your contact.';
            }
        }
        return RESTresponse;


    }

    @HttpPatch
    global static String updateUninvitedGuests() {

        RestRequest req = RestContext.request;
        String secretKey = req.headers.get('Key');

        if (!RESTservice.checkKey(secretKey)) {
            return 'Wrong key';
        }

        List<Guest__c> uninvitedGuests = [
                SELECT Name
                FROM Guest__c
                WHERE Is_Invited__c = false];
        for (Guest__c uninvitedGuest : uninvitedGuests) {
            uninvitedGuest.Is_Invited__c = true;
        }

        update uninvitedGuests;
        String resp = 'This Guests were updated ' + uninvitedGuests;
        return resp;
    }

    @HttpDelete
    global static String deleteGuest() {

        RestRequest req = RestContext.request;
        String secretKey = req.headers.get('Key');
        String getNameFromURI = req.requestURI.substring(6);

        if (!RESTservice.checkKey(secretKey)) {
            return 'Wrong key';
        }
        List<Guest__c> guestsForDelete = [
                SELECT Name
                FROM Guest__c
                WHERE Name = : getNameFromURI
        ];
        if (guestsForDelete.isEmpty()){
            return 'Oops, there is no Guest with such Name here.';
        }
        System.debug('Guest for del' + guestsForDelete);
        delete guestsForDelete;
        return 'Guest is deleted';
        //C-0000 Name format
    }

    @HttpPost
    global static String useSecretWord(String secretWord) {
        List<Password__c> secretWords = [
                  SELECT Secret_Word__c
                  FROM Password__c
        ];
        System.debug(secretWords);
        for(Password__c password : secretWords ) {
            if (String.valueOf(password.Secret_Word__c) == secretWord){
                List<Password_Keys__c> secretKey = new List<Password_Keys__c>();
                Password_Keys__c randomKey = new Password_Keys__c(Key__c = EncodingUtil.convertToHex(crypto.generateAesKey(128)).substring(0,5));
                secretKey.add(randomKey);
                insert secretKey;
                return 'Secret word is generated';
            }
        }
        return 'The password is wrong';

    }

    public static Boolean checkKey(String key) {
        List<Password_Keys__c> secretKey = [
                SELECT Key__c, CreatedDate
                FROM Password_Keys__c
                WHERE Key__c = :key
        ];
        System.debug(secretKey);
        if (secretKey.isEmpty()) {
            return false;
        }
        if (secretKey[0].CreatedDate <= System.now().addMinutes(-1)){
            return false;
        }
        System.debug(secretKey[0].CreatedDate);
        System.debug(System.now().addMinutes(-1));
        return true;
    }

}