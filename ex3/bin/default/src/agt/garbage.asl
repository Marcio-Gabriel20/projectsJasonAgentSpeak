garbage(1,1).

+garbage(X,Y) <-
	.wait(10000);
	.send(boat, tell, garbage(X,Y));
	.wait(10000);
	.send(boat, tell, garbage(1,2));
	.wait(10000);
	.send(boat, tell, garbage(4,4));
	.wait(10000);
	.send(boat, tell, garbage(2,6)).