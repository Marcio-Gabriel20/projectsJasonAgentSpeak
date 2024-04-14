// Agent stock in project 

/* Initial beliefs and rules */

smartphone(2).
book(50).
shelf(5).
shirt(100).

/* Initial goals */

!checkStock("Smartphone", 1).

/* Plans */

// +!checkStock(Item, Amount) : Item == "Smartphone" & smartphone(Stock) & (Amout > Stock) <-
    // .print("Estoque disponível. - Produto: ", Item, " --- Quantidade: ", Amount, " --- Estoque: ", Stock).

+!checkStock(Item, Amount) : Item == "Smartphone" & smartphone(Stock) & (Amout > Stock) <-
    .print("Estoque disponível. - Produto: ", Item, " --- Quantidade: ", Amount, " --- Estoque: ", Stock).