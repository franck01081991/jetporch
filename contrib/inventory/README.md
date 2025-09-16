Scripts d'inventaire pour Jetporch
==================================

https://www.jetporch.com/inventory/dynamic-cloud-inventory

À propos de ce dépôt
====================

Jet utilise un format de script d'inventaire initialement développé pour Ansible en 2012, lui-même inspiré d'une fonctionnalité antérieure de Puppet
appelée « external nodes ».

Ce répertoire a démarré comme un fork amical des scripts d'inventaire Ansible. Ces scripts ont été retirés de l'arbre Ansible après la version 2.9
lorsqu'Ansible est passé à un nouveau système de plugins d'inventaire difficiles à appeler depuis d'autres outils, d'où ce fork.

Grâce à ce fork, Jet peut prendre en charge le format original de script d'inventaire malgré les différences de langage de programmation (Jet est écrit
en Rust).
Nous pensons que d'autres projets peuvent aussi exploiter ces données JSON comme indiqué sur la page d'accueil de Jetporch, et nous les y encourageons !

Contenu
=======

Consultez le répertoire inventory/ pour découvrir tous les plugins proposés.

La plupart des plugins fonctionnent en copiant le plugin d'inventaire depuis le dépôt
avec le fichier de configuration associé. De nombreux plugins répondent également à des variables d'environnement. Les détails sont quasiment toujours mentionnés
dans le code source.

Adapter un script d'inventaire à vos besoins est vivement encouragé si vous en avez envie, ce qui explique pourquoi les scripts fournis ne font pas partie d'un
ensemble logiciel étroitement intégré.

Statut
======

Comme le code d'origine avait plusieurs années lorsque nous avons créé Jeti (septembre 2023), certains plugins peuvent nécessiter des modifications pour fonctionner
ou pour exposer de nouvelles fonctionnalités de certains services. Les mises à jour via des correctifs sont très bienvenues et traitées rapidement !

Nous souhaitons que tout le contenu fonctionne avec un niveau de qualité élevé, et si certains scripts sont irrécupérables à cause de changements
majeurs d'API, merci de nous prévenir afin qu'ils puissent être retirés.

Testés
======

Nous tenons à jour une liste des plugins validés jusqu'ici :

* Azure
* AWS/EC2
* Digital Ocean
* Docker
* GCE
* OpenStack

Presque tous les plugins devraient renvoyer du JSON, ils n'ont peut-être simplement pas encore été testés
avec des configurations cloud complètes. Toute aide à la validation est la bienvenue.

Si vous confirmez qu'un plugin fonctionne (ou présente des limitations), signalez-le par un correctif ou même un ticket GitHub. Les plugins sans utilisateur
ni ticket pendant un an complet pourront être supprimés.

Lignes directrices pour le support et le développement
======================================================

Aucun plugin ne doit être considéré comme non pris en charge, mais ils sont « maintenus par la communauté », car tous les services ou fonctionnalités concernés ne
sont pas utilisés régulièrement par l'équipe projet.

Nous souhaitons évidemment que les inventaires pour des systèmes comme AWS/EC2, GCE, etc., soient d'une qualité particulièrement élevée.

Merci de rester respectueux et de ne pas contacter les auteurs mentionnés du code historique
pour obtenir de l'aide sur les scripts d'inventaire Jeti forkés ; les noms sont conservés pour des raisons d'attribution et de copyright, pas pour le support.

Quand un plugin importe du code depuis "jeti.module_utils", il est généralement possible de modifier le plugin pour ne plus en dépendre, car une grande partie de ce
code concerne la compatibilité historique avec Python 2.X. Nous n'avons aucun problème à exiger Python 3. Les correctifs supprimant les imports de jeti.module_utils
(accompagnés de tests suffisants du module) seront toujours acceptés ! Une fois tous les imports depuis jeti supprimés, nous pourrons effacer
définitivement le répertoire 'lib/' de ce dépôt.

Si vous souhaitez porter des fonctionnalités issues de scripts d'inventaire développés depuis Ansible 2.9, c'est possible, mais assurez-vous
que ces ports sont bien testés et n'ont aucune dépendance à Ansible (ou au répertoire legacy module_utils de Jeti que nous cherchons à retirer).
En d'autres termes, les scripts doivent être entièrement autonomes, hormis leurs dépendances externes issues de PyPI ou éventuellement de Cargo
pour de futurs programmes d'inventaire dynamiques en Rust.

Notez que Jetporch accepte une interprétation plus souple de l'ancien format de module Ansible que Michael avait défini en 2012. Les scripts de ce dépôt (notamment les plus récents) peuvent donc diverger et ne pas être chargeables par Ansible classique.
Cela ne nous pose aucun problème et ne constitue pas une contrainte de développement. Cette souplesse facilite le développement de nouveaux scripts.

Voir https://www.jetporch.com/inventory/dynamic-cloud-inventory pour la spécification JSON.

Les nouveaux scripts d'inventaire n'ont pas besoin d'accepter « --host », car cet argument n'est jamais utilisé et Jet ne passe pas d'arguments aux scripts d'inventaire.
Les correctifs supprimant cette fonctionnalité de scripts existants seront également acceptés.

Même si Jet gère efficacement les grands jeux de données, certains plugins d'inventaire renvoient aussi un grand nombre de variables pouvant s'avérer inutiles pour l'automatisation.
Par exemple, si chaque hôte renvoie la liste complète des tailles d'instance possibles pour une région, les correctifs supprimant ces informations sont d'excellentes candidates. Idéalement, seul le contenu pertinent doit apparaître dans le JSON.

Tester un script
================

Suivez les instructions de chaque plugin d'inventaire pour vérifier qu'il fonctionne avec votre infrastructure :

1. Rendez le plugin exécutable avec « chmod +x plugin.py », puis lancez-le manuellement via « ./plugin.py » ou « python3 ./plugin.py ».
2. Vous devrez peut-être installer des dépendances, par exemple « pip3 install requests » si nécessaire. Si le plugin ne mentionne pas
   les commandes pip à exécuter en tête de fichier, les correctifs pour les ajouter seront bienvenus ! Chaque plugin peut
   également disposer de son propre fichier README ".md" nommé d'après le plugin d'inventaire.
3. Vous devrez peut-être configurer le fichier de configuration du module. Dans ce cas, copiez le fichier de configuration et le script
   dans un autre répertoire et modifiez le fichier de configuration sur place. Assurez-vous que ces modifications n'apparaissent pas
   dans vos correctifs envoyés au dépôt, afin de ne pas divulguer de clé API !
4. Exécutez ensuite le script d'inventaire avec jetp : « jetp show --inventory ./plugin.py --groups all » pour voir comment Jet charge le plugin.
   Vous pouvez désormais examiner le même JSON que Jet reçoit !
5. Vous pouvez maintenant utiliser le plugin d'inventaire avec « jetp ssh --inventory ./plugin.py --playbook playbook.yml » !

Auteurs
=======

Ansible a été créé par [Michael DeHaan](https://github.com/mpdehaan)
et bénéficie de contributions de milliers d'utilisateurs. Nous leur sommes reconnaissants pour chacune
de leurs contributions ici. [Ansible](https://www.ansible.com) est maintenu par et
où est une marque déposée de [Red Hat, Inc](https://www.redhat.com>).

Les contributions à ce dépôt depuis septembre 2023 sont réalisées par
les contributeurs de Jeti, un sous-projet de [Jetporch](https://www.jetporch.com).

Licence
=======

GNU General Public License v3.0 ou ultérieure, voir COPYING pour plus de détails.
