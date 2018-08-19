/**
 * Created by Lena on 18.08.18.
 */

public with sharing class CustomAppGetCases {
        @AuraEnabled
        public static List<Case> getCases() {
            List<Case> cases = [
                    SELECT CaseNumber, Subject, Status, CreatedDate
                    FROM Case
            ];
            System.debug('Im work');
            return cases;
        }

}