// Agent kate in project 

/* Initial beliefs and rules */

// order([product("Smartphone", 1)], 500).

/* Initial goals */

// !order.

/* Plans */

// +!order <-
//     .print("Enviando pedidos...");
//     .wait(1000);
//     .send(purchase, tell, purchaseRequest("Smartphone", 1));
//     .wait(5000);
//     .send(purchase, tell, purchaseRequest("Smartphone", 5)).
