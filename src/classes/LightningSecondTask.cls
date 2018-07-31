public class LightningSecondTask {
//
        @AuraEnabled
        public static List<Account> getAccounts(){
            List<Account> accounts = [
                    SELECT Name, Site
                    FROM Account
            ];
            System.debug('Apex works');
            System.debug(accounts);
            return accounts;
        }


}