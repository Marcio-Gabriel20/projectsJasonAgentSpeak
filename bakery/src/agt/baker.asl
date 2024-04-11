item(beer,20,1.2).
item(chocolate,100,2.5).

+order(Cart, Money)[source(Customer)] <-
	.print("[BAKERY]: This is ", Customer, "'s Cart: ", Cart,". I'm starting to process the order. Cash received is ", Money);	
	+bill(Customer, 0, Money);
	!process(Cart, Customer).

+!process([First|Remaining], Customer) <-
		.print("[BAKERY]: Now processing: ", First, " from ", Customer, " --- Waiting on the line: ", Remaining);
		!checkout(First, Customer);
		!process(Remaining, Customer).

+!process([], Customer) <-
	.print("[BAKERY]: All items of ", Customer, "'s order were processed.");
	!finishOrder(Customer).
	
+!checkout(item(Item,Amount), Customer) <-
	.findall(item(Item, Stock, Value), item(Item, Stock, Value), Result);
	!checkingStock(Result, item(Item,Amount), Customer).

+!checkingStock([item(ItemStock,Stock,Value)],item(Item,Amount), Customer): 
	bill(Customer, Total, Change) &
        Stock >= Amount &
	Change >= Amount*Value <-
		-item(Item,_,_);
		+item(Item,Stock-Amount,Value);
		.print("[BAKERY]: I found ", Stock, " of ", Item, " and the order is ", Amount, ". It remains ", Stock-Amount, " of ", Item, " in my stock.");
		-bill(Customer,_,_);
		+bill(Customer,Total+(Amount*Value),Change-(Amount*Value));
		?bill(Customer, NewTotal, NewChange);
		.print("[BAKERY]: The temporary bill for ", Customer ," is ", NewTotal, " and the change is ", NewChange).

-!checkingStock([item(ItemStock,Stock,Value)],item(Item,Amount), Customer):
	bill(Customer, Total, Change) &
	Change < Amount*Value <-
		.print("[BAKERY]: There is no cash left to buy ", Item);
		.print("[BAKERY]: Remaining cash is ", Change, ". It is necessary at least ", Amount*Value).

-!checkingStock([item(ItemStock,Stock,Value)],item(Item,Amount), Customer):
	Stock < Amount <-
		.print("[BAKERY]: Sorry! We do not have enough ", Item, ". We only have ", Stock).

+!finishOrder(Customer): 
	bill(Customer, Total, Change) <-
		.print("[BAKERY]: ", Customer,"'s RECEIPT: ORDER VALUE:", Total," --- CHANGE:", Change);
		.send(Customer,tell,bill(Customer, Total, Change));
		-bill(Customer,_,_).