@isTest
private class OrderItemTriggerTest {

    @isTest
    static void testFulfilledOrder() {

        Order__c ord = new Order__c(
            Name = 'Test Order',
            Status__c = 'Pending'
        );
        insert ord;

        List<Order_Item__c> items = new List<Order_Item__c>();

        for(Integer i=0; i<2; i++) {
            items.add(new Order_Item__c(
                Name = 'Item ' + i,
                Order__c = ord.Id,
                Status__c = 'Delivered'
            ));
        }

        insert items;

        Order__c updatedOrder =
            [SELECT Status__c FROM Order__c WHERE Id = :ord.Id];

        System.assertEquals('Fulfilled', updatedOrder.Status__c);
    }

    @isTest
    static void testPartiallyCancelledOrder() {

        Order__c ord = new Order__c(
            Name = 'Cancel Order',
            Status__c = 'Pending'
        );
        insert ord;

        insert new Order_Item__c(
            Name = 'Cancelled Item',
            Order__c = ord.Id,
            Status__c = 'Cancelled'
        );

        Order__c updatedOrder =
            [SELECT Status__c FROM Order__c WHERE Id = :ord.Id];

        System.assertEquals(
            'Partially Cancelled',
            updatedOrder.Status__c
        );
    }

    @isTest
    static void testBulkProcessing() {

        List<Order__c> orders = new List<Order__c>();

        for(Integer i = 0; i < 200; i++) {
            orders.add(new Order__c(
                Name = 'Order ' + i,
                Status__c = 'Pending'
            ));
        }

        insert orders;

        List<Order_Item__c> items = new List<Order_Item__c>();

        for(Order__c ord : orders) {
            items.add(new Order_Item__c(
                Name = 'Bulk Item',
                Order__c = ord.Id,
                Status__c = 'Delivered'
            ));
        }

        insert items;

        System.assertEquals(200, items.size());
    }
}