public class OrderItemHandler {

    public static void updateOrderStatus(List<Order_Item__c> orderItems) {

        Set<Id> orderIds = new Set<Id>();

        for(Order_Item__c item : orderItems){
            if(item.Order__c != null){
                orderIds.add(item.Order__c);
            }
        }

        if(orderIds.isEmpty()) return;

        List<Order_Item__c> allItems = [
            SELECT Id, Order__c, Status__c
            FROM Order_Item__c
            WHERE Order__c IN :orderIds
        ];

        Map<Id, List<Order_Item__c>> orderItemMap = new Map<Id, List<Order_Item__c>>();

        for(Order_Item__c item : allItems){
            if(!orderItemMap.containsKey(item.Order__c)){
                orderItemMap.put(item.Order__c, new List<Order_Item__c>());
            }
            orderItemMap.get(item.Order__c).add(item);
        }

        List<Order__c> ordersToUpdate = new List<Order__c>();

        for(Order__c ord : [
            SELECT Id, Status__c
            FROM Order__c
            WHERE Id IN :orderIds
        ]){

            Boolean allDelivered = true;
            Boolean hasCancelled = false;

            for(Order_Item__c item : orderItemMap.get(ord.Id)){

                if(item.Status__c == 'Cancelled'){
                    hasCancelled = true;
                }

                if(item.Status__c != 'Delivered'){
                    allDelivered = false;
                }
            }

            if(hasCancelled){
                ord.Status__c = 'Partially Cancelled';
            }
            else if(allDelivered){
                ord.Status__c = 'Fulfilled';
            }

            ordersToUpdate.add(ord);
        }

        if(!ordersToUpdate.isEmpty()){
            update ordersToUpdate;
        }
    }
}