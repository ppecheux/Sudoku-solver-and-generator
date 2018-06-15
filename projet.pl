% Porojet de IA2

%Le zero est une case vide.
chiffre([1,2,3,4,5,6,7,8,9,0]).

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

%Exemple de grille à résoudre:
%3 0 7 0 0 0 0 0 1 0 4 0 0 0 8 7 0 0 8 5 0 0 0 0 2 4 0 7 0 3 0 5 0 0 1 2 5 0 0 8 0 6 0 0 3 6 2 0 0 7 0 5 0 4 0 7 2 0 0 0 0 5 8 0 0 5 3 0 0 0 9 0 4 0 0 0 0 0 1 0 6

grilleM([3,0,7,0,0,0,0,0,1,0,4,0,0,0,8,7,0,0,8,5,0,0,0,0,2,4,0,7,0,3,0,5,0,0,1,2,5,0,0,8,0,6,0,0,3,6,2,0,0,7,0,5,0,4,0,7,2,0,0,0,0,5,8,0,0,5,3,0,0,0,9,0,4,0,0,0,0,0,1,0,6]).

grilleP([
0,1,5,6,3,0,9,7,2,
0,0,0,4,7,9,1,8,5,
7,8,0,2,1,5,3,0,4,
9,2,6,3,4,1,7,5,8,
1,3,8,7,0,6,4,2,9,
5,7,4,9,8,2,6,3,1,
2,5,7,1,6,4,8,9,3,
8,4,3,5,0,7,2,1,6,
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


remplirCase(G,G1):-			remplirCaseVide(G,G1,9).

remplirCaseRan(G,G1):-			remplirCaseVideRan(G,G1,9).

remplirCaseVide(G,G1,C):-
							C>0,
							getElement2(I,J,G,0),
							setAij(C,I,J,G,G1),
							getCol1(J,G1,Col),
							valideliste(Col),
							getLigne2(I,G1,Lig),
							valideliste(Lig),
							getCarreAIJ(I,J,G1,Car),
							valideliste(Car).

remplirCaseVide(G,G1,C):-
	C >0,
	C1 is C-1,
	remplirCaseVide(G,G1,C1).

remplirCaseVideRan(G,G1,C):-
							C>0,
							getElement2(I,J,G,0),
							random_between(1, 9, R),
							setAij(R,I,J,G,G1),
							getCol1(J,G1,Col),
							valideliste(Col),
							getLigne2(I,G1,Lig),
							valideliste(Lig),
							getCarreAIJ(I,J,G1,Car),
							valideliste(Car).

remplirCaseVideRan(G,G1,C):-
	C >0,
	C1 is C-1,
	remplirCaseVideRan(G,G1,C1).


remplirGrille(G, Res):- 			remplirGrille2(G, G, Res).

remplirGrille2(G, [], Res):- 		Res=G.

remplirGrille2(G, [0|G1], Res):- 	remplirCaseRan(G,G2),
									valideGrille(G2),
									%listToSudoku(G2),
									remplirGrille2(G2, G1, Res).

remplirGrille2(G, [A|G1], Res):- 	A\==0,
									remplirGrille2(G, G1, Res).


remplirGrille2(G, [A|G1], Res):- 	A\==0,
									remplirGrille2(G, G1, Res).

remplir(G, Res):- 			remplir2(G,G,Res).

remplir2(G, [], Res):- 		Res=G, writeln('GAGNE').

remplir2(G, [0|G1], Res):-  repeat, 
							writeln('Ligne a remplir:'),
							readln([I|_]),
							writeln('Colonne a remplir de la ligne '),
							readln([J|_]),
							writeln('Chiffre a mettre:'),
							readln([C|_]),
							I2 is I-1,
							J2 is J-1,
							setAij(C,I2,J2,G,G2),
							valideGrille(G2),
							listToSudoku(G2),
							remplir2(G2, G1, Res).

remplir2(G, [A|G1],Res):- 	A\==0,
							remplir2(G, G1, Res).

remplir2(G, G1, Res):- 	remplirGrilleUtilisateur(G, Res),
						listToSudoku(Res).

vidageGrille(G, G, 0).
vidageGrille(G, G1, N):- 	N>0, N1 is N-1,
							random_between(0,8, I),
							random_between(0,8, J),
							setAij(0, I, J, G, G2),
							vidageGrille(G2, G1, N1).

sudoku():-	writeln('Jouer?(Y/N)'),
			readln([X]),
			X=='Y', !,
			play().

sudoku():-	writeln('Solutionner une grille?(Y/N)'),
			readln([X]),
			X=='Y', !,
			writeln('Entrez la grille sous la forme => 0 3 6 0 9 ...'),
			readln(G),
			listToSudoku(G),
			solve(G, Res),
			listToSudoku(Res).

play():- 	grilleVide(G),
			remplirGrille(G, G1),
			%listToSudoku(G1),
			writeln('Choisissez le nombre de cases vides (entre 0 et 81):'),
			readln([X]),
			vidageGrille(G1, G2, X),
			listToSudoku(G2),
			remplir(G2, Res).	


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
%getCarreAIJ permet de revoyer le carre asocié à l élément en question CA marche
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
%grille(M),solve(M,G1).
%grille(G),getElement2(I,J,G,0),setAij(8,I,J,G,G1),getCol1(J,G1,Col),valideliste(Col).
