public class CustomContTaskTwo {
    public List<Contact> allCont {get;set;} 
    
    public CustomContTaskTwo() {
        allCont = [
            SELECT Name, Email, Phone
            FROM  Contact
        ];
    }

}