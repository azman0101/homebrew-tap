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
| `meld-patched` | Meld pour macOS (arm64) avec le correctif du placement de fenêtre (meld#966) | [azman0101/meld-macos](https://github.com/azman0101/meld-macos) |

### meld-patched

- Entre en conflit avec le cask officiel `meld` : `brew uninstall --cask meld`
  d'abord.
- Le DMG vient des releases GitHub de `azman0101/meld-macos`. Il n'est signé
  qu'ad hoc ; le cask retire l'attribut de quarantaine après installation.
- Le cask est testé par la CI de `azman0101/meld-macos` (job `cask`), qui
  récupère ce fichier.
- À chaque nouvelle release, reporter la version et le sha256 indiqué dans les
  notes de release.
