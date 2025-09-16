Note à l'attention des développeurs qui parcourent ce dossier :

Tous les fichiers de ce répertoire sont des fichiers que nous préférerions que les scripts d'inventaire n'utilisent pas, mais ils sont présents car
certains scripts peuvent encore les importer, ce qui ne pose pas vraiment problème. La plupart concernent la compatibilité Python 2.X.

De manière générale, nous souhaitons que les scripts d'inventaire ne dépendent que de modules issus de PyPI (pip3 install …) et restent autonomes.
Exiger Python 3 est totalement acceptable, d'autant que nous ne demandons pas l'installation de Python sur les hôtes distants.

Puisque le support de Python 3 est désormais généralisé, la suppression des imports utilisant six, etc., peut être réalisée
dans les fichiers du répertoire inventory/ à tout moment, et les pull requests en ce sens sont très appréciées !

Une fois qu'aucun import de jeti.* ne subsistera dans les scripts du répertoire inventory/, nous pourrons supprimer complètement ce
répertoire, ce qui constitue notre objectif (non prioritaire).

Aucun nouveau code ne doit être ajouté dans ce répertoire.

--Projet Jetporch
