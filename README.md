# Homebrew tap for Halyard

[Halyard](https://github.com/aamirsahmad/halyard) is an unofficial Signal client for macOS and Linux.

## Install

```sh
brew install --cask aamirsahmad/halyard/halyard
```

Homebrew 7 and later ask you to trust a new tap. If Homebrew asks, run:

```sh
brew trust aamirsahmad/halyard
```

## Update and remove

```sh
brew upgrade --cask halyard
brew uninstall --cask halyard        # keeps your messages
brew uninstall --zap --cask halyard  # also deletes your messages and keys
```

## Note about Gatekeeper

Apple has not notarised Halyard yet. The cask removes the quarantine attribute after
installation, so macOS does not block the first start.

Halyard is not affiliated with or endorsed by Signal.
