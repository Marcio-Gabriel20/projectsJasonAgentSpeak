// Agent purchase in project 

/* Initial beliefs and rules */

purchaseId(0).
purchase(Id, Item, Amount, Status).
/* Initial goals */

!request.

/* Plans */

+!request : purchaseRequest(Item, Amount, Status) & purchaseId(Number) <-
    -+purchaseId(Number+1);
    .wait(1000);
    .send(stock, achieve, checkItem(Item, Amount));
    .wait(1000);
    -purchaseRequest(Item, Amount)[source(_)];
    !createPurchase(Number+1, Item, Amount);
    !request.

+!request <-
    .wait(1000);
    .print("Esperando um pedido...");
    !request.

+!createPurchase(Id, Item, Amount) : status(Status) <-
    -+purchase(Id, Item, Amount, Status).