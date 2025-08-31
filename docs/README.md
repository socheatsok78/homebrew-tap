## Formula

Audit and Test commands:
```
HOMEBREW_NO_INSTALL_FROM_API=1 brew audit --new dsd-fme
HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source --verbose --debug <formula>
HOMEBREW_NO_INSTALL_FROM_API=1 brew test <formula>
/opt/homebrew/Library/Taps/socheatsok78/homebrew-tap/Formula/<formula>.rb
```


## Troubleshooting

### Remove all installed forumlae
```sh
brew remove --force $(brew list --formula)
```

### Remove installed formula and its dependencies
```sh
brew rm FORMULA
brew rm $(join <(brew leaves) <(brew deps FORMULA))
```
