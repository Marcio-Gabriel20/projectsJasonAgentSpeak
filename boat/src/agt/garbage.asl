garbage(3,4).

+garbage(X,Y) <-
	.wait(10000);
	.send(boat, tell, garbage(X,Y));
	.wait(10000);
	.send(boat, tell, garbage(1,2));
	.wait(10000);
	.send(boat, tell, garbage(4,4)).