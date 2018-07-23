public class CustomContTaskOne {
    public Contact cont {get; set;}
    
    public CustomContTaskOne(){
        cont = [SELECT Name, Email, Phone
               FROM Contact
               WHERE Id = :ApexPages.currentPage().getParameters().get('id')
               ];
    }
    public PageReference redirect(){
        PageReference ref = new PageReference('/apex/CustomContTaskTwo');
        return ref;
        
    }
}