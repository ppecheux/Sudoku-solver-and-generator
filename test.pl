long([],0).
long([_|L],X):-long(L,RE),X is RE+1.

%git clone [url repo]
%git status //pour voir les documents présents dans le dossier rouge pour untracked (non added) et vert pour committed
%git add test.pl // pour mettre le fichier dans le commit.
%git commit -m "commentaire"
%git push origin master
