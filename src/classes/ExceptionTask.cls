public class ExceptionTask  {
    
    public class MyException extends Exception {}
    
    public static void exceptClassMethod(){
        try {
            List<Account> test = [SELECT Id FROM Account];
            System.debug(test[0].Name);
		} catch(SObjectException e) {
    		System.debug('1.The following exception has occurred: ' + e.getMessage());
		}
        try {
    		Contact a = new Contact(LastName = null);
    		insert a;        
		} catch(DmlException e) {
    		System.debug('2.The following exception has occurred: ' + e.getMessage());
		}
        try {
    		List<Integer> s = new List<Integer>();
            s.add(1);
            s.get(1);
		} catch(ListException e) {
    		System.debug('3.The following exception has occurred: ' + e.getMessage());
		}
        try {
    		String s;
			s.toLowerCase();
		} catch(NullPointerException e) {
    		System.debug('4.The following exception has occurred: ' + e.getMessage());
		}
    }
    public static void dmlErrorHandler(){
        try {
    		insert new Account();       
		} catch(DmlException e) {
            Integer numErrors = e.getNumDml();
            for (Integer i=0; i<numErrors; i++){
                System.debug('The number of failed rows: ' + numErrors);
                System.debug('The System Status Code: ' + e.getDmlType(0));
                System.debug('The failed record Id: ' + e.getDmlId(i));
                System.debug('The failed record Index: ' + e.getDmlIndex(i));
                System.debug('User Message for this exception: ' + e.getDmlMessage(i));
                System.debug('The fields that caused the error:  '  + e.getDmlFieldNames(i));
                System.debug('The fields tokens are:  '  + e.getDmlFields(i));
            }
		}
    }

	public static void getAccountHandler(List<Account> accs){ 
		for (Account a : accs) {
			try { 
				if (a.NumberOfEmployees !=null){
					System.debug('This Account has ' + a.NumberOfEmployees + ' employees');
				} else {
					throw new MyException('Something is wrong');
				}
			} catch(Exception e) {
				System.debug('This Account has no employees');
			}
		}
	}
}