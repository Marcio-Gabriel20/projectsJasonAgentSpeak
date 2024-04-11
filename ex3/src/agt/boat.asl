boat :- garbage(X,Y) & position(Z,W) & X == Z & Y == W.

position(1,1).

!collectGarbage.

+!collectGarbage : boat <-
    !printPositions;
    -garbage(X,Y)[source(_)];
    .print("Lixo coletado.");
    .wait(2000);
    !collectGarbage.

+!collectGarbage : garbage(X,Y) & position(Z,W) & (X \== Z | Y \== W) <-
    !printPositions;
    .wait(1000);
    !move.

+!collectGarbage <-
    .print("Esperando lixo para coletar");
    .wait(5000);
    !collectGarbage.

+!printPositions : garbage(X,Y) & position(Z,W) <-
    .print("Estou em [", Z, " x ", W, "]");
    .print("O lixo está em [", X, " x ", Y, "]").

+!move : garbage(X,Y) & position(Z,W) & (X > Z) <-
    -+position(Z+1,W);
    .print("Estou me movendo para [", Z+1, " x ", W, "]");
    !collectGarbage.

+!move : garbage(X,Y) & position(Z,W) & (X < Z) <-
    -+position(Z-1,W);
    .print("Estou me movendo para [", Z-1, " x ", W, "]");
    !collectGarbage.

+!move : garbage(X,Y) & position(Z,W) & (X == Z & Y > W) <-
    -+position(Z,W+1);
    .print("Estou me movendo para [", Z, " x ", W+1, "]");
    !collectGarbage.

+!move : garbage(X,Y) & position(Z,W) & (X == Z & Y < W) <-
    -+position(Z,W-1);
    .print("Estou me movendo para [", Z, " x ", W-1, "]");
    !collectGarbage.