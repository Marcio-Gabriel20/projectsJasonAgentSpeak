// Agent alice in project exercicio1Lista1

/* Initial beliefs and rules */

jorgeParameters(Name, Age) :- name(Name) & age(Age).

name("Jorge Aragão").
age(90).

/* Initial goals */

!introduce.

/* Plans */

+!introduce : jorgeParameters(Name, Age) <-
    .print("My name is ", Name, " and I am ", Age, " years old.");
    !yourNumber.

+!introduce <-
    .print("I've introduced myself before.").

+!yourNumber <-
    .print("Can you give me your number, baby?");
    .wait(2000);
    !thankYou.

+!thankYou : xuxaNumber(Number) <-
    .print("That's us, totosa!").

+!thankYou <-
    .print("Can you give us your number so we can exchange a lero chase?");
    !thankYou.