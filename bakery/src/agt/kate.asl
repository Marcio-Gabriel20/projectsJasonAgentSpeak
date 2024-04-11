order([item(beer,10),item(chocolate,3)],100).

!order.

+!order: order(Cart, Money) <- 
	.print("[KATE]: This is my Cart: ", Cart);
	.print("[KATE]: I'm sending it to the Baker.");	
	.send(baker, tell, order(Cart, Money)).