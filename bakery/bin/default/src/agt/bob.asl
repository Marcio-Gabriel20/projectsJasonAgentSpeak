order([item(chocolate,5)],20).

!order.

+!order: order(Cart, Money) <- 
	.wait(2000);
	.print("[BOB]: This is my Cart: ", Cart);
	.print("[BOB]: I'm sending it to the Baker.");	
	.send(baker, tell, order(Cart, Money)).