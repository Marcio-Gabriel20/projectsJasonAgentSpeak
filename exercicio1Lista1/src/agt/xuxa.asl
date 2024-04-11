number("123-1234").

+number(Number) <-
    .wait(2000);
    .send(jorgeAragao, tell, xuxaNumber(Number)).
