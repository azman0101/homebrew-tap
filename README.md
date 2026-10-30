# homebrew-tap

Tap Homebrew personnel d'azman0101.

```bash
brew tap azman0101/tap
brew trust azman0101/tap   # Homebrew refuse les taps tiers non approuvés
brew install --cask azman0101/tap/<cask>
```

## Casks

| cask           | description                                                        | source |
|----------------|--------------------------------------------------------------------|--------|
| `meld-patched` | Meld 3.22.3 pour macOS (arm64) avec le correctif du placement de fenêtre (meld#966) | [azman0101/meld-macos](https://github.com/azman0101/meld-macos) |
| `meld-patched@3.24` | Meld 3.24.1, même correctif, sur le runtime de 3.22.3 (espaces de l'interface corrects) | [azman0101/meld-macos](https://github.com/azman0101/meld-macos) |

### meld-patched, meld-patched@3.24

- Les deux installent `Meld.app` : ils sont en conflit entre eux et avec le
  cask officiel `meld`. Pour changer :
  `brew uninstall --cask meld-patched && brew install --cask azman0101/tap/meld-patched@3.24`.
- Le DMG vient des releases GitHub de `azman0101/meld-macos`. Il n'est signé
  qu'ad hoc ; le cask retire l'attribut de quarantaine après installation.
- Le cask est testé par la CI de `azman0101/meld-macos` (job `cask`), qui
  récupère ce fichier.
- À chaque nouvelle release, reporter la version et le sha256 indiqué dans les
  notes de release.
