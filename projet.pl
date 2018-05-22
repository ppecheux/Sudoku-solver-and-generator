% Porojet de IA2
chiffre([1,2,3,4,5,6,7,8,9]).

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
6,9,1,8,2,3,5,4,7 ]).

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

indiceElement(I,J,N):-N is I*9+J.

getElement(_,_,[],_):-write("la case correspondante n'existe pas"),!.
getElement(0,0,[X|_],X).
getElement(I,J,[_|L],X):-N is I*9+J-1, I2 is N/9, J2 is N-I2, getElement(I2,J2,[L],X).

getLigne(_,[],_):-write("la ligne correspondante n'existe pas"),!.
getLigne(I,[G],[L]):- setof(X, getElement(I,_,[G],X),L) . %trouver un moyen de rassembler les resultats de cette requette dans une liste

getCol(_,[],_):-write("la colonne correspondante n'existe pas"),!.
getLigne(J,[G],[L]):- setof(X,getElement(_,J,[G],X),L).

%LES CARRES SONT IDENTIFIES PAR LES INDICES DE LA CASE EN HAUT A GAUCHE DU CARRE
getCarre(I,J,[G],[L]):-getElement(I,J,G,Aij),getElement(I+1,J,G,Ai1j),getElement(I+2,J,G,Ai2j),
                        getElement(I,J+1,G,Aij1),getElement(I+1,J+1,G,Ai1j1),getElement(I+2,J+1,G,Ai2j1),
                        getElement(I,J+2,G,Aij2),getElement(I+1,J+2,G,Ai1j2),getElement(I+2,J+2,G,Ai2j2),
                        L is [Aij,Ai1j,Ai2j,Aij1,Ai1j1,Ai2j1,Aij2,Ai1j2,Ai2j2].


%quel nom de variable pour le 3 e argument desetof dans validListe?
ValideGrille([]):- write("la grille est vide"),!.
ValideGrille([G]):- Valideliste(setof(L,getLigne(_,G,L),M)),
                    Valideliste(setof(L,getCol(_,G,L),N)),
                    getCarre(0,0,G,UL),getCarre(3,0,G,UM),getCarre(6,0,G,UR),
                    getCarre(0,3,G,ML),getCarre(3,3,G,MM),getCarre(6,3,G,MR),
                    getCarre(0,6,G,LL),getCarre(3,6,G,LM),getCarre(6,6,G,DR),
                    Valideliste([UL]),Valideliste([UL]),Valideliste([UL]),
                    Valideliste([UL]),Valideliste([UL]),Valideliste([UL]),
                    Valideliste([UL]),Valideliste([UL]),Valideliste([UL]).

Valideliste([]):- !.
Valideliste([X|A]):- ValideElement(X, A),Valideliste(A).

ValideElement(X, []).
ValideElement(X, [Y|Z]):- X\=Y,In(X,Chiffre), ValideElement (X,Z).

In(X,[]):-write("l'element n'est pas dans la liste"),!.
In(X,[X,_]).
In(X,[Y,L]):-In(X,L).

%pour imprimer un tableau sous forme de sudoku
listToSudoku([],_,_) :- !.

listToSudoku(G) :-
  afficherColonneSudoku(2),
  listToSudoku(G,0,0),
  nl,write('------------------').

listToSudoku(G,I,9) :-%pour commencer une seule ligne
  !,
  afficherColonneSudoku(I),
  I1 is I + 1,
  listToSudoku(G,I1,0).

listToSudoku([Aij|G],I,J) :-
  write(Aij),
  afficherLigneSudoku(J),
  J1 is J + 1,
  listToSudoku(G,I,J1).


afficherLigneSudoku(J) :-
  egale2modulo3(J), !,
  %(J mod 3)==2, !,
  write('|').

afficherLigneSudoku(_) :- write(' ').

afficherColonneSudoku(I) :-
  egale2modulo3(I), !,
  nl, write('-------------------'), nl,
  write('|').

afficherColonneSudoku(_) :-
  nl, write('|').


egale2modulo3(N) :-
  I is (N mod 3),
  I == 2.

  % listToSudoku([8,0,4,0,0,0,2,0,9,0,0,9,0,0,0,1,0,0,1,0,0,3,0,2,0,0,7,0,5,0,1,0,4,0,8,0,0,0,0,0,3,0,0,0,0,0,1,0,7,0,9,0,2,0,5,0,0,4,0,3,0,0,8,0,0,3,0,0,0,4,0,0,4,0,6,0,0,0,3,0,1]).
 %listToSudoku([8,0,4,0,0,0,2,0,9]).
  %listToSudoku([8,0,4,0,0,0,2,0,9]).
  %getLigne(1,[8,0,4,0,0,0,2,0,9,0,0,9,0,0,0,1,0,0,1,0,0,3,0,2,0,0,7,0,5,0,1,0,4,0,8,0,0,0,0,0,3,0,0,0,0,0,1,0,7,0,9,0,2,0,5,0,0,4,0,3,0,0,8,0,0,3,0,0,0,4,0,0,4,0,6,0,0,0,3,0,1],L).
