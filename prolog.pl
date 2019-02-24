findSum(L,N) :- adder2(L,Sum), findAns(N,Sum).

sum-up-numbers-general(L, N) :- findSum(L,N).
