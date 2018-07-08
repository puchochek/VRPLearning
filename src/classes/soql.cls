public class soql {
    public static void findQyery(){
        Map<String, List<Child__c>> parentWithChild = new Map<String, List<Child__c>>();
			for (Parent__c p : [
            SELECT Name, (SELECT  Name FROM Children__r)
            FROM Parent__c
            ])	{ 
                System.debug(p.Children__r);
                parentWithChild.put(p.Name, p.Children__r);
                System.debug(parentWithChild);
            	}
	}
        
}