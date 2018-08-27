public class SendEmail {
    
    public static void greetNewContact(List<Contact> createdContacts) {
        List<Messaging.SingleEmailMessage> emailsForSend = new List<Messaging.SingleEmailMessage>();  
        for (Contact createdContact : createdContacts) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setSenderDisplayName('Lena');
            mail.setBccSender(false);
            mail.setUseSignature(false);
            EmailTemplate myTemplate = [
                SELECT Id 
                FROM EmailTemplate
                WHERE Name = 'Welcome'
                LIMIT 1
            ];
            mail.setTemplateId(myTemplate.Id);
            mail.setTargetObjectId(createdContact.Id);
            emailsForSend.add(mail);
        }
        Messaging.sendEmail(emailsForSend);                                             
    }

}