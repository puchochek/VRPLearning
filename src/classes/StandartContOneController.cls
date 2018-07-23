public class StandartContOneController {
    public StandartContOneController(ApexPages.StandardController std) {
        
    }
    public PageReference redirect(){
        PageReference ref = new PageReference('/apex/StandartContTaskTwo');
        return ref;
        
    }
}