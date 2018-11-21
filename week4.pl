plant(grass).
plant(dandelions).
eats(tiger, meat).
eats(lion, meat).
eats(rabbit, veg).
eats(pig, meat).
eats(pig,veg).
animal(pig).
animal(lion).
animal(tiger).
animal(rabbit).

eats(owl, meat).
animal(owl).

plant(fly_trap).
animal(fly).
eats(fly_trap, fly).


type(X, omnivore):- eats(X, meat),eats(X, veg).
type(X, carnivore):- eats(X, meat),not(type(X, omnivore)).
type(X, herbivore):- eats(X, veg), not(type(X, omnivore)).
type(X, Y, cannibal) :- eats(X, meat),eats(Y, meat), (X=Y).

type(X, Y) :- plant(X), animal(Y), eats(X, Y).

can_eat(X,Y):- type(X, carnivore),animal(Y),not(X=Y).
can_eat(X,Y):- type(X, Y, cannibal), X=owl.
can_eat(X,Y):- type(X, herbivore),plant(Y), not(Y=fly_trap).
can_eat(X,Y):- type(X, omnivore),plant(Y).

can_eat(X, Y) :- type(X, Y).

