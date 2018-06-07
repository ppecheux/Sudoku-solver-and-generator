% Porojet de IA2

%Le zero est une case vide.
chiffre([1,2,3,4,5,6,7,8,9,0]).

/*grille([
a1,a2,a3,a4,a5,a6,a7,a8,a9,
b1,b2,b3,b4,b5,b6,b7,b8,b9,
c1,c2,c3,c4,c5,c6,c7,c8,c9,
d1,d2,d3,d4,d5,d6,d7,d8,d9,
e1,e2,e3,e4,e5,e6,e7,e8,e9,
f1,f2,f3,f4,f5,f6,f7,f8,f9,
g1,g2,g3,g4,g5,g6,g7,g8,g9,
h1,h2,h3,h4,h5,h6,h7,h8,h9,
i1,i2,i3,i4,i5,i6,i7,i8,i9 ]).*/

grille([
4,1,5,6,3,8,9,7,2,
3,6,2,4,7,9,1,8,5,
7,8,9,2,1,5,3,6,4,
9,2,6,3,4,1,7,5,8,
1,3,8,7,5,6,4,2,9,
5,7,4,9,8,2,6,3,1,
2,5,7,1,6,4,8,9,3,
8,4,3,5,9,7,2,1,6,
6,9,1,8,2,3,5,4,7]).

grilleP([
0,1,5,6,3,0,9,7,2,
0,0,0,4,7,9,1,8,5,
7,8,0,2,1,5,3,6,4,
9,2,6,3,4,1,7,5,8,
1,3,8,7,5,6,4,2,9,
5,7,4,9,8,2,6,3,1,
2,5,7,1,6,4,8,9,3,
8,4,3,5,9,7,2,1,6,
6,9,1,8,2,3,5,4,7]).

grilleVide([
0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0]).

grillecare([ul,um,ur,ml,mm,mr,dl,dm,dr]).
ul([a1,a2,a3,b1,b2,b3,c1,c2,c3]).
um([a4,a5,a6,b4,b5,b6,c4,c5,c6]).
ur([a7,a8,a9,b7,b8,b9,c7,c8,c9]).
ml([d1,d2,d3,e1,e2,e3,f1,f2,f3]).
mm([d4,d5,d6,e4,e5,e6,f4,f5,f6]).
mr([d7,d8,d9,e7,e8,e9,f7,f8,f9]).
dl([g1,g2,g3,h1,h2,h3,i1,i2,i3]).
dm([g4,g5,g6,h4,h5,h6,i4,i5,i6]).
dr([g7,g8,g9,h7,h8,h9,i7,i8,i9]).

grilleligne([lA,lB,lC,ld,lE,lF,lG,lH,lI]).
lA([a1,a2,a3,a4,a5,a6,a7,a8,a9]).
lB([b1,b2,b3,b4,b5,b6,b7,b8,b9]).
lC([c1,c2,c3,c4,c5,c6,c7,c8,c9]).
ld([d1,d2,d3,d4,d5,d6,d7,d8,d9]).
lE([e1,e2,e3,e4,e5,e6,e7,e8,e9]).
lF([f1,f2,f3,f4,f5,f6,f7,f8,f9]).
lG([g1,g2,g3,g4,g5,g6,g7,g8,g9]).
lH([h1,h2,h3,h4,h5,h6,h7,h8,h9]).
lI([i1,i2,i3,i4,i5,i6,i7,i8,i9]).

grillecolonne([col1,col2,col3,col4,col5,col6,col7,col8,col9]).
col1([a1,b1,c1,d1,e1,f1,g1,h1,i1]).
col2([a2,b2,c2,d2,e2,f2,g2,h2,i2]).
col3([a3,b3,c3,d3,e3,f3,g3,h3,i3]).
col4([a4,b4,c4,d4,e4,f4,g4,h4,i4]).
col5([a5,b5,c5,d5,e5,f5,g5,h5,i5]).
col6([a6,b6,c6,d6,e6,f6,g6,h6,i6]).
col7([a7,b7,c7,d7,e7,f7,g7,h7,i7]).
col8([a8,b8,c8,d8,e8,f8,g8,h8,i8]).
col9([a9,b9,c9,d9,e9,f9,g9,h9,i9]).



%on considère que les lignes et le colonnes commencent à 0.
/*nToij(0,0,0):-!.
nToij(0,J,J):-J<9,!.
nToij(I,J,N):-
	I1 is 1+I,
	N1 is N-9,
	nToij(I1,J,N1),!.*/

nToij(I,J,N):-catch(I is N div 9, 
        error(Err,_Context),
        (write('instantiation_error'),fail)),J is N-I*9,!.
nToij(I,J,N):-N is 9*I+J,!.

getElement2(I,J,G,X):- 
	getElementN(N,G,X),	nToij(I,J,N),!.

getElementN(0,[X|_],X).
getElementN(N,[_|G],X):-
	getElementN(N1,G,X),
	N is N1+1.



getElement(0,0,[X|_],X).
getElement(0,J,[_|L],X):- 
	J2 is J-1,
	getElement(0,J2,L,X).
getElement(I,J,[_,_,_,_,_,_,_,_,_|L],X):-
	I2 is I-1,
	getElement(I2,J,L,X),!.



setAij(A,0,0,[_|G],[A|G]):-!.
setAij(A,0,J,[T|G],[T|Guptade]):-
	J2 is J-1,
	setAij(A,0,J2,G,Guptade),!.
setAij(A,I,J,[T0,T1,T2,T3,T4,T5,T6,T7,T8|G],[T0,T1,T2,T3,T4,T5,T6,T7,T8|Guptade]):-
	I2 is I-1,
	setAij(A,I2,J,G,Guptade),!.

remplirCase(G,G1):-remplirCaseVide(G,G1,9).

remplirCaseVide(G,G1,C):-
	C>0,
	getElement2(I,J,G,0),
	setAij(C,I,J,G,G1),
	getCol1(J,G1,Col),
	valideliste(Col),
	getLigne2(I,G1,Lig),
	valideliste(Lig),
	getCarreAIJ(I,J,G1,Car),
	valideliste(Car),!.

remplirCaseVide(G,G1,C):-
	C1 is C-1,
	remplirCaseVide(G,G1,C1).

solve(G,G):- \+getElement2(I,J,G,0),valideGrille(G),!.

solve(G,G1):- remplirCase(G,Guptade), solve(Guptade,G1).


getLigne2(0,[A,B,C,E,F,G,H,I,J|_],[A,B,C,E,F,G,H,I,J]):-!.
getLigne2(I,[_,_,_,_,_,_,_,_,_|L],X):- 
	I2 is I-1,
	getLigne2(I2,L,X).

getCol1(J,G,L):-getCol2(J,G,L,0).

getCol2(_,_,[],81).
getCol2(_,[],[],_).

getCol2(J,[T|G],[T|L],C):- 
	congru(C,9,J),!,
	C1 is C+1,
	getCol2(J,G,L,C1),!.

getCol2(J,[T|G],[_,_,_,_,_,_,_,_|L],C):-
	Rest=J+1,
	congru(C,9,Rest),!,
	C1 is C+8,
	getCol2(J,G,L,C1).

getCol2(J,[T|G],L,C):-
	C1 is C+1,
	getCol2(J,G,L,C1).

%LES CARRES SONT IDENTIFIES PAR LES iNDICES DE LA CASE EN HAUT A GAUCHE DU CARRE
%ATTENTION IL DONNE DEUX SOLUTIONS PUIS ENVOIE FALSE
getCarre(I,J,G,[Aij,Ai1j,Ai2j,Aij1,Ai1j1,Ai2j1,Aij2,Ai1j2,Ai2j2]):-
	getElement(I,J,G,Aij),getElement(I+1,J,G,Ai1j),getElement(I+2,J,G,Ai2j),
    getElement(I,J+1,G,Aij1),getElement(I+1,J+1,G,Ai1j1),getElement(I+2,J+1,G,Ai2j1),
    getElement(I,J+2,G,Aij2),getElement(I+1,J+2,G,Ai1j2),getElement(I+2,J+2,G,Ai2j2).
%getCarreAIJ permet de revoyer le carre asocié à l'élément en question CA marche
getCarreAIJ(I,J,G,L):-
	congru(I,3,0),
	congru(J,3,0),
	getCarre(I,J,G,L),!.

getCarreAIJ(I,J,G,L):-
	congru(I,3,0),
	J1 is J-1,
	getCarreAIJ(I,J1,G,L),!.
getCarreAIJ(I,J,G,L):-
	I1 is I-1,
	getCarreAIJ(I1,J,G,L).


valideCarres(G):-
	getCarre(0,0,G,UL),getCarre(3,0,G,UM),getCarre(6,0,G,UR),
    getCarre(0,3,G,ML),getCarre(3,3,G,MM),getCarre(6,3,G,MR),
    getCarre(0,6,G,LL),getCarre(3,6,G,LM),getCarre(6,6,G,DR),
    valideliste(UL),valideliste(UM),valideliste(UR),
    valideliste(ML),valideliste(MM),valideliste(MR),
    valideliste(LL),valideliste(LL),valideliste(LL),!.

valideGrille(G):-
	valideLignes(G,0),
	valideCols(G,0),
	valideCarres(G).

valideCols(_,9):-!.
valideCols(G,I):-
	getCol1(I,G,L),
	valideliste(L),
	I1 is I+1,
	valideCols(G,I1).

valideLignes(_,9):-!.
valideLignes(G,I):-
	getLigne2(I,G,L),
	valideliste(L),
	I1 is I+1,
	valideLignes(G,I1).

%Complexite de O(n3) pour valide liste avec n=9 pour le sudoku 9*9.

valideliste([]).
valideliste([X|A]):- valideElementRapide(X, A),valideliste(A),!.

valideElement(X, []).
valideElement(X, [Y|Z]):- X\=Y,chiffre(C),in(X,C), valideElement(X,Z),!.

valideElementRapide(X,[]).
valideElementRapide(0,_).
valideElementRapide(X, [Y|Z]):-X\=Y,valideElementRapide(X,Z),!.
in(X,[]):-fail.
in(X,[X|_]):-!.
in(X,[Y|L]):-in(X,L).

entreMinMax(Min,X,Max):-X>=Min,X=<Max.



%%%%%IMPRESSION DU SUDOKU%%%%%%%

congru(N,M,R) :-
	I is (N mod M),
	I == R.

listToSudoku([],_) :- !.

listToSudoku([Aij|G],A):-
	write(Aij),
	hSeparator(A),
	vSeparator(A),
	A1=A+1,
	listToSudoku(G,A1).

hSeparator(A):-
	congru(A,3,2),!,write('|');
	write(' ').

vSeparator(A):-
	cvSeparator(A),
	congru(A,9,8),!,nl,write('|');
	true.

cvSeparator(A):-
	congru(A,27,26),!,
	nl, write('+-----+-----+-----+');
	true.

listToSudoku(G) :-
  vSeparator(-1),%ligne du haut
  listToSudoku(G,0).

  %%%%%TESTS DES PREDICATS%%%%%%%

  % listToSudoku([8,0,4,0,0,0,2,0,9,0,0,9,0,0,0,1,0,0,1,0,0,3,0,2,0,0,7,0,5,0,1,0,4,0,8,0,0,0,0,0,3,0,0,0,0,0,1,0,7,0,9,0,2,0,5,0,0,4,0,3,0,0,8,0,0,3,0,0,0,4,0,0,4,0,6,0,0,0,3,0,1]).
 %listToSudoku([8,0,4,0,0,0,2,0,9]).
  %listToSudoku([8,0,4,0,0,0,2,0,9]).
  %getLigne(1,[8,0,4,0,0,0,2,0,9,0,0,9,0,0,0,1,0,0,1,0,0,3,0,2,0,0,7,0,5,0,1,0,4,0,8,0,0,0,0,0,3,0,0,0,0,0,1,0,7,0,9,0,2,0,5,0,0,4,0,3,0,0,8,0,0,3,0,0,0,4,0,0,4,0,6,0,0,0,3,0,1],L).
%getElement(0,0,[8,0,4,0,0,0,2,0,9,0,0,9,0,0,0,1,0,0,1,0,0,3,0,2,0,0,7,0,5,0,1,0,4,0,8,0,0,0,0,0,3,0,0,0,0,0,1,0,7,0,9,0,2,0,5,0,0,4,0,3,0,0,8,0,0,3,0,0,0,4,0,0,4,0,6,0,0,0,3,0,1],X).
%getElement(0,1,[8,0,4,0,0,0,2,0,9,0,0,9,0,0,0,1,0,0,1,0,0,3,0,2,0,0,7,0,5,0,1,0,4,0,8,0,0,0,0,0,3,0,0,0,0,0,1,0,7,0,9,0,2,0,5,0,0,4,0,3,0,0,8,0,0,3,0,0,0,4,0,0,4,0,6,0,0,0,3,0,1],X).
%getElement(0,2,[8,0,4,0,0,0,2,0,9,0,0,9,0,0,0,1,0,0,1,0,0,3,0,2,0,0,7,0,5,0,1,0,4,0,8,0,0,0,0,0,3,0,0,0,0,0,1,0,7,0,9,0,2,0,5,0,0,4,0,3,0,0,8,0,0,3,0,0,0,4,0,0,4,0,6,0,0,0,3,0,1],X).
%grille(L),listToSudoku(L),getElement(5,5,L,E),getLigne2(2,L,M),getCol1(2,L,C),getCarre(3,3,L,K).
%valideElement(3, [1,2,4,5,6,7]).
%in(1,[1,2,3,4,5,6,7,8,9]).
%valideliste([1,2,3,4,5,6,7,8,9]).
%grille(G),listToSudoku(G),insererAij(2,0,0,G,H),listToSudoku(H).
%grille(G),chiffre(C),in(J,C),setof(X,getElement(0,J,G,X),L).
% grille(G),setAij(0,0,0,G,G1),getElement2(I,J,G1,0),setAij(5,I,J,G1,G2).
%grille(G),setAij(0,3,1,G,G1),getElement2(I,J,G1,0),setAij(5,I,J,G1,G2).
%grilleVide(G),remplirCase(G,G1),remplirCase(G1,G2).
%grille(G),solve(G,G1).
%grille(G),getElement2(I,J,G,0),setAij(8,I,J,G,G1),getCol1(J,G1,Col),valideliste(Col).