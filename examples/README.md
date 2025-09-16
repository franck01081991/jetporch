Contenu d'exemples Jetporch
===========================

Ce répertoire contient du contenu d'automatisation de démonstration pour apprendre, explorer et tester Jet.

Démonstrations de langage générales
===================================

De nombreux exemples de playbooks se trouvent dans playbooks/ et constituent des démonstrations assez autonomes du fonctionnement.

Démonstrations complètes
=======================

Notre première démonstration complète installe Redis comme application exemple en utilisant des rôles Jet. Elle ne couvre pas
l'ensemble des fonctionnalités du langage, mais offre une excellente vue d'ensemble pour comprendre les bases et
appréhender le fonctionnement.

Consultez les fichiers du dépôt, puis nous vous montrons comment exécuter l'exemple.

Configuration de l'inventaire
=============================

Pour le mode push SSH, il faut d'abord configurer l'inventaire. Vous pouvez ignorer cette étape si vous exécutez le playbook en local.

1. Copiez le répertoire inventory dans ~/private_inventory et ajoutez des adresses de machines que vous possédez en éditant groups/redis.
2. Dans les environnements cloud, vous utiliserez probablement une source d'inventaire cloud. Cette procédure est expliquée dans la documentation
en ligne ; pour l'instant, procédons par nom d'hôte ou adresse IP.

Clés SSH
========

Si vous souhaitez utiliser SSH, Jet doit connaître vos clés SSH :

1. Lancez « ssh-agent » pour démarrer une session ssh-agent si ce n'est pas déjà fait.
2. Exécutez « ssh-add ~/.ssh/id_rsa » ou ajoutez une autre clé SSH utilisable pour les systèmes définis ci-dessus.

Prêt à exécuter Jet
===================

1. Assurez-vous que le répertoire target/release issu de la construction de « jetp » est présent dans votre $PATH.
2. Pour les modes SSH, si vous devez vous connecter avec un autre utilisateur que celui de votre machine locale, exportez JET_SSH_USER=username, ou pensez à ajouter --user à la commande plus tard.
3. Toujours pour SSH, si l'utilisateur souhaité à l'étape précédente n'est pas root, décommentez la ligne sudo dans le playbook ou ajoutez --sudo root à la commande plus tard.

Lancer le mode SSH
==================

Pour exécuter l'une de nos démonstrations complètes, lancez « make redis_ssh_demo » ou reprenez la commande définie dans la cible Makefile et exécutez-la directement. Ajoutez --user utilisateur ou --sudo utilisateur-sudo selon les besoins, comme indiqué ci-dessus.
Vous pouvez exécuter jetp depuis n'importe quelle machine Linux, Unix ou Mac.

La configuration par défaut de Jet utilise 20 threads pour la configuration parallèle, mais vous pouvez facilement en exécuter 100 ou plus.
D'autres fonctionnalités sont présentées dans la documentation en ligne de Jet (voir https://www.jetporch.com).

Vous pouvez aussi lancer les démonstrations plus petites, mais vous devrez construire la ligne de commande vous-même, car elles n'ont pas toutes de cibles Makefile.

Lancer le mode local
====================

Depuis un hôte Enterprise Linux ou Debian/Ubuntu, exécutez « sudo make redis_local ». D'autres systèmes d'exploitation pourront être ajoutés à cet exemple ultérieurement.
Aucune des instructions SSH n'est nécessaire.

Questions/Aide ?
================

Pas de souci ! Consultez le chat Discord, la documentation et les informations communautaires sur https://www.jetporch.com/

Licence
=======

Même si cela ne s'applique pas au reste du projet, le contenu d'exemple de ce répertoire est dans le domaine public.
Jet est un programme sous licence GPLv3.
