public with sharing class AccountSearchController {

    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchKey) {

        if(String.isBlank(searchKey)) {
            return new List<Account>();
        }

        return [
            SELECT Id, Name, Industry, Phone
            FROM Account
            WHERE Name LIKE :('%' + searchKey + '%')
            LIMIT 10
        ];
    }
}