# Jetporch - l'orchestrateur professionnel Jet Enterprise

Jetporch (alias Jet) est une plateforme d'automatisation informatique polyvalente et portée par la communauté pour la gestion de configuration,
le déploiement, l'orchestration, la mise à jour et l'exécution de tâches arbitraires.

Jet est un projet sous licence GPLv3, créé et animé par [Michael DeHaan](https://home.laserllama.net) ([<michael@michaeldehaan.net>](mailto:michael@michaeldehaan.net)).

Liens

* [Toute la documentation](https://www.jetporch.com/)
* [Installation](https://www.jetporch.com/basics/installing-from-source)
* [Blog et annonces](https://jetporch.substack.com/)
* [Discussion Discord](https://www.jetporch.com/community/discord-chat)
* [Guide de contribution](https://www.jetporch.com/community/contributing)

Merci de rediriger toutes les questions, demandes d'aide et discussions fonctionnelles vers Discord.

## Utilisation

Exécuter un playbook écrit en YAML avec un inventaire :

```bash
jetp ssh examples/playbooks/site.yml -i examples/inventory
```

`examples/playbooks/site.yml` :

```yaml
- name: dire bonjour
  groups:
    - all
  tasks:
    - !shell
      cmd: "echo hello from Jet"
```

## Développement

Avant d'ouvrir une pull request, assurez-vous que le code passe les vérifications Rust standards :

```bash
cargo fmt
cargo clippy -- -D warnings
cargo test
```

> **Remarque**
> Les modules hérités s'appuient actuellement sur des autorisations Clippy au niveau de la crate afin de pouvoir exécuter le linter en CI. Consultez `docs/adr/0002-clippy-global-allow.md` pour le contexte et les actions de suivi.
