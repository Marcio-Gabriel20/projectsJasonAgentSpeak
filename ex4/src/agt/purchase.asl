// Agent purchase in project 

/* Initial beliefs and rules */

purchaseId(0).
purchase(Id, Item, Amount, Status).
/* Initial goals */

// !purchase.

/* Plans */

// +!purchase : purchaseRequest(Item, Amount) & purchaseId(Number) <-
//     .print("Pedido Recebido - Item: ", Item, " --- Quantidade: ", Amount);
//     -+purchaseId(Number+1);
//     -+purchase(Number+1, Item, Amount, "request");
//     .wait(1000);
//     // .send(stock, achieve, checkStock(Item, Amount));
//     -purchaseRequest(Item, Amount)[source(_)];
//     !purchase.

// +!purchase <-
//     .wait(1000);
//     .print("Esperando um pedido...");
//     !purchase.