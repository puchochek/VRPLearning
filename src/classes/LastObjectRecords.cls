/**
 * Created by Lena on 19.08.18.
 */

public with sharing class LastObjectRecords {
    @AuraEnabled
    public static List<RecentlyViewed> getLastRecords() {
        List<RecentlyViewed> recentlyVieweds = [
                SELECT Name, Id
                FROM RecentlyViewed
        ];
        System.debug('Apex works');
        return recentlyVieweds;
    }
}