found :- garbage(X,Y) & position(Z,W) & X == Z & Y == W.

position(1,1).

!hasGarbage.

+!hasGarbage: found <-	
		!print;
		.print("[BOAT]: I've found the garbage.");
		-garbage(X,Y)[source(_)];
		!hasGarbage.	

+!hasGarbage: 
	garbage(X,Y) & 
	position(Z,W) & 
	(X \== Z | Y \== W) <-	
		!print;
		.wait(1000);
		!move.

+!hasGarbage <-
	.print("[BOAT]: Waiting for some garbage to appear.");
	.wait(5000);
	!hasGarbage.

+!print: 
	position(Z,W) &
	garbage(X,Y) <-
		.print("[BOAT]: I'm in X=", Z, " and Y=", W, ".");
		.print("[BOAT]: Garbage is in X=", X, " and Y=", Y, ".").	

+!move: 
	garbage(X,Y) & 
	position(Z,W) & 
	X>Z <-
		-+position(Z+1,W);
		.print("[BOAT]: Moving to (", Z+1,",",W,").");
		!hasGarbage.

+!move: 
	garbage(X,Y) & 
	position(Z,W) & 
	X<Z <-
		-+position(Z-1,W);
		.print("[BOAT]: Moving to (", Z-1,",",W,").");
		!hasGarbage.

+!move: 
	garbage(X,Y) & 
	position(Z,W) & 
	X==Z &
	Y>W <-
		-+position(Z,W+1);
		.print("[BOAT]: Moving to (", Z,",",W+1,").");
		!hasGarbage.

+!move: 
	garbage(X,Y) & 
	position(Z,W) & 
	X==Z &
	Y<W <-
		-+position(Z,W-1);
		.print("[BOAT]: Moving to (", Z,",",W-1,").");
		!hasGarbage.
