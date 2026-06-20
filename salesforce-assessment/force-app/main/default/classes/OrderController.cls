public with sharing class OrderController {

    @AuraEnabled(cacheable=true)
    public static List<String> getTestData() {
        return new List<String>{'Order A', 'Order B'};
    }

    @AuraEnabled
    public static String updateOrderStatus(Id orderId, String status) {
        try {
            Order__c ord = [SELECT Id, Status__c FROM Order__c WHERE Id = :orderId LIMIT 1];
            ord.Status__c = status;
            update ord;
            return 'Success';
        } catch (Exception e) {
            return 'Error: ' + e.getMessage();
        }
    }
}