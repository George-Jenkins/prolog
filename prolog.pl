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

list_empty([], true).
list_empty([_|_], false).

append( [], X, X).
append( [X | Y], Z, [X | W]) :- append( Y, Z, W).

newList(L,[],L).
newList(L,[X|Li],NL) :- number(X), append(L,[X],New), newList(New,Li,NL).
newList(L,[X|Li],NL) :- newList(L,Li,NL).
newList(L,N,L).

min([],X,X).
min([H|T],M,X) :- H =< M, min(T,H,X).
min([H|T],M,X) :- M < H, min(T,M,X).
min([H|T],X) :- min(T,H,X).

findMin(L,M) :- newList([],L,NL), min(NL,M).
findAnsw(Min1,N,Answ) :- Min1 \= N, Answ = false.
findAnsw(Min1,N,Answ) :- Min1 = N, Answ = true.

checkCorrectMin(Min1,Min2,L1,L2,N,A) :- Min1>Min2, findAnsw(Min1,N,A).
checkCorrectMin(Min1,Min2,L1,L2,N,A) :- Min1=Min2, delete(L1,Min1,NewL1), findMins(NewL1,L2,N,A).
checkCorrectMin(Min1,Min2,L1,L2,N,A) :- Min1<Min2, delete(L1,Min1,NewL1), findMins(NewL1,L2,N,A).

findMins([],L2,N,Answ) :- Answ = false.
findMins(L1,[],N,Answ) :- findMin(L1,Min1), findAnsw(Min1,N,Answ).
findMins(L1,L2,N,Answ) :- findMin(L1,Min1), findMin(L2,Min2), checkCorrectMin(Min1,Min2,L1,L2,N,Answ).

runProgram(L1, L2, N, A) :- newList([],L1,Li1), newList([],L2,Li2), findMins(Li1,Li2,N,A).

getAns(A) :- A=true, true.
getAns(A) :- A=false, false.

min-above-min(L1, L2, N) :- runProgram(L1, L2, N, A), !,getAns(A).
