RIVAYO_TECH — Déploiement web

Prérequis
- Flutter installé
- Git initialisé et connecté à GitHub

Construire localement
```bash
flutter pub get
flutter build web --release
```
Le contenu généré se trouve dans `build/web/`.

Déployer manuellement sur `gh-pages` (simple):
```bash
# depuis le root du projet
git add -A
git commit -m "Prepare web build"
# créer branche gh-pages indépendante
git checkout --orphan gh-pages
git --work-tree=build/web add --all
git --work-tree=build/web commit -m "Deploy web build"
git push origin gh-pages --force
# revenir à la branche principale
git checkout -f main
```

Déploiement automatique
- Un workflow GitHub Actions est inclus: `.github/workflows/flutter-web-deploy.yml`.
- Poussez vos changements sur `main` et Actions build + déploie automatiquement sur `gh-pages`.

Remarques
- Personnalisez `web/index.html` (titre, meta) avant de déployer.
- Si vous utilisez un `base href` personnalisé, passez `--base-href` lors du build.
