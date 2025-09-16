# ADR 0001 : renommer le module `handle::handle` en `handle::core`

## Statut
Accepté

## Contexte
Le module Rust `handle::handle` dupliquait le nom de son module parent, ce qui faisait échouer la construction à cause de l'alerte Clippy `module_inception`. Le module expose le handle d'exécution des tâches partagé entre les modules, le renommage doit donc préserver l'API publique pour le code en aval.

## Décision
Renommer le fichier de module en `src/handle/core.rs`, l'exposer sous le nom `handle::core`, et ré-exporter `TaskHandle` et `CheckRc` à la racine de l'espace de noms `handle`. Cette approche corrige l'alerte tout en maintenant le fonctionnement des consommateurs existants via les types ré-exportés.

## Conséquences
* Clippy ne signale plus `module_inception` pour le sous-système de handle.
* Les modules en aval importent désormais `crate::handle::{TaskHandle, CheckRc}` au lieu du chemin dupliqué.
* Les ajouts futurs doivent privilégier des noms de module uniques pour éviter des alertes similaires.
