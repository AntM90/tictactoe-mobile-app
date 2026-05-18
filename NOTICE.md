# Notice

## Approche générale

L'idée était de poser une base propre pour un TicTacToe, en respectant une clean architecture orientée features. Même pour un projet aussi petit, je voulais montrer une structure qui pourrait scaler (ajouter une feature "stats", "settings", etc.) sans repartir de zéro.

J'assume quelques compromis quand ça permet de simplifier la lecture et la maintenance du code.

## Architecture

3 couches par feature :

- **domain** : entités (Player, Board, Game), interfaces des repositories, services métier
- **data** : implémentations concrètes, datasource SharedPreferences
- **presentation** : notifiers, states, pages, widgets

### State management

Riverpod sans codegen, par habitude et parce que je trouve ça plus explicite. Le codegen de riverpod reste malgré ça efficace, mais je ne l'ai pas utilisé.

Deux notifiers :
- `GameNotifier` : pilote l'état de la partie (board, current player, statut)
- `ScoreNotifier` : pilote les scores persistés (AsyncNotifier car chargement async)

Le `GameNotifier` appelle `ScoreNotifier.incrementScore` quand une victoire est détectée. C'est un choix volontaire d'avoir le codé métier entièrement du côté notifier plutôt que côté UI, pour garder la logique métier hors des widgets.

### Injection de dépendances

Un provider par classe, dans le même dossier que l'implémentation. 

### Persistance

SharedPreferences pour les scores. Le `sharedPreferencesProvider` est instancié dans `main()` puis injecté via `overrideWithValue` selon la doc de riverpod.

### Compromis assumés

- **Utilisation de l'IA** : Claude Code, avec switch de modèle entre Haiku/Sonnet voire Opus. Rtk activé en global pour réduire un peu la conso de token. Montée en puissance en partant des couches basses codées en première intention entièrement à la main, puis entrée de l'IA en mode agentique sur des requêtes de plus en plus grosses. Enfin sur l'UI, définition des éléments visuels avec une UI basique, puis itération avec des agents par micro-itérations pour affiner l'expérience utilisateur.

## Ce qui est implémenté

- Logique du jeu : validation des coups, détection victoire, détection match nul, alternance des joueurs
- Persistance des scores avec SharedPreferences
- UI complète : grille de fond, halos sur les symboles, animations sur le tap et le reset (AnimatedSwitcher), animation des scores qui changent, états visuels des cards (idle / active / winner / loser)
- Tests unitaires sur `GameService` (coeur de la logique métier)

## Pas traité (manque de temps)

- Saisie des noms des joueurs (hardcodés "Joueur 1" / "Joueur 2")
- Tests sur le notifier, le repository et le datasource (j'ai concentré l'effort de test sur la logique métier pure)
- Internationalisation (textes en dur en français)
- Compteur de "match nul" dans les scores
- Theme clair (seulement dark)

## Avec plus de temps

- Customisation : saisie des noms, choix des couleurs/symboles
- Stats : historique des parties, streak, ratio victoires
- Animations : cascade au reset (effet vague cellule par cellule), confettis sur la victoire
- Multijoueur online
- Theming clair/sombre suivant le système
- CI/CD avec tests automatisés
