public class TemplateComponentController {
    public Id myContactId {get; set;}
    
    public Contact getCurrentContact(){
        return [SELECT Account.Name, Account.AccountNumber, Account.Phone, Account.BillingStreet, Account.Type
		FROM Contact
        WHERE Id = : myContactId];
    }
//
}