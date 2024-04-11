order([item(beer,8)],10).

!order.

+!order: order(Cart, Money) <- 
	.wait(1000);
	.print("[TEDDY]: This is my Cart: ", Cart);
	.print("[TEDDY]: I'm sending it to the Baker.");	
	.send(baker, tell, order(Cart, Money)).