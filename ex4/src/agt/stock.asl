// Agent stock in project 

/* Initial beliefs and rules */

smartphone(2).
book(50).
shelf(5).
shirt(100).

/* Initial goals */

/* Plans */

+!checkItem(Item, Amount) : Item == "Smartphone" <-
    !checkStock(Amount).

+!checkItem(Item, Amount) : Item == "Book" <-
    !checkStock(Amount).

+!checkItem(Item, Amount) : Item == "Shelf" <-
    !checkStock(Amount).

+!checkItem(Item, Amount) : Item == "Shirt" <-
    !checkStock(Amount).

+!checkItem(Item, Amount) : Item \== "Smartphone" | Item \== "Book" | Item \== "Shelf" | Item \== "Shirt" <-
    .print("Esse item não existem em nosso estoque.").

+!checkStock(Amount) : smartphone(Stock) & (Amount <= Stock) <-
    -+smartphone(Stock-Amount);
    .send(purchase, tell, status("finish")).

+!checkStock(Amount) : smartphone(Stock) & (Amount > Stock) <-
    .send(purchase, tell, status("refused")).

+!checkStock(Amount) : book(Stock) & (Amount <= Stock) <-
    -+book(Stock-Amount);
    .send(purchase, tell, status("finish")).

+!checkStock(Amount) : book(Stock) & (Amount > Stock) <-
    .send(purchase, tell, status("refused")).

+!checkStock(Amount) : shelf(Stock) & (Amount <= Stock) <-
    -+shelf(Stock-Amount);
    .send(purchase, tell, status("finish")).

+!checkStock(Amount) : shelf(Stock) & (Amount > Stock) <-
    .send(purchase, tell, status("refused")).

+!checkStock(Amount) : shirt(Stock) & (Amount <= Stock) <-
    -+shirt(Stock-Amount);
    .send(purchase, tell, status("finish")).

+!checkStock(Amount) : shirt(Stock) & (Amount > Stock) <-
    .send(purchase, tell, status("refused")).