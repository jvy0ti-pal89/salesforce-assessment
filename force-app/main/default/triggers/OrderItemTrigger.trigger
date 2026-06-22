trigger OrderItemTrigger on Order_Item__c (after insert, after update) {
    OrderItemHandler.updateOrderStatus(Trigger.new);
}