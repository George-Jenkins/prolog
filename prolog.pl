numTest(X,A) :- number(X), A is X.
numTest(X,A) :- A is 0.

adder([ ],0).
adder([X|L],Sum) :- adder(L,SL), numTest(X,A), Sum is A + SL.

findAns(N,Sum) :- N=Sum, true.
findAns(N,Sum) :- N\=Sum, false.

findSum(L,N) :- adder(L,Sum), findAns(N,Sum).

sum-up-numbers-simple(L, N) :- findSum(L,N).

numTest2(X,A) :- number(X), A is X.
numTest2(X,A) :- is_list(X), adder2(X,A).
numTest2(X,A) :- A is 0.

adder2([ ],0).
adder2([X|L],Sum) :- adder2(L,SL), numTest2(X,A), Sum is A + SL.

findSum(L,N) :- adder2(L,Sum), findAns(N,Sum).

sum-up-numbers-general(L, N) :- findSum(L,N).
