global class SendEmailToAdmin implements Schedulable{

    global void execute(SchedulableContext SC) {
        Messaging.reserveMassEmailCapacity(1);
        
        List<Account> createdAccounts = [
            SELECT Id, Name 
            FROM Account
            WHERE CreatedDate >= :Date.today().addDays(-1)
        ];
        List<Contact> createdContacts = [
            SELECT Id, Name 
            FROM Contact
            WHERE CreatedDate >= :Date.today().addDays(-1)
        ];
        List<Case> createdCases = [
            SELECT Id 
            FROM Case
            WHERE CreatedDate >= :Date.today().addDays(-1)
        ];
             
        Profile sysAdmin = [
            SELECT Id 
            FROM Profile 
            WHERE Name = 'System Administrator'
        ];
          
		List<User> sysAdminEmail = [
            SELECT Id, Email 
            FROM User
            WHERE ProfileId = :sysAdmin.Id
        ];
        
		String[] toAddresses = new String[] {sysAdminEmail[0].Email};  
            
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Lena');
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setPlainTextBody('Folloving objects were created tooday ' + System.now() + '\n Accounts: ' + createdAccounts + '\n Contacts: ' + createdContacts + '\n Cases ' + createdCases);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});            
    }
}