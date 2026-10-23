# Debagr for Homebrew

Publisher-owned Homebrew cask and binary release channel for Debagr, a native
macOS menu-bar app and JSON CLI for deploying signed iOS apps through their
paired Mac over a private VPN.

**Prepared technical preview: 0.2.0. This repository and its release remain
private drafts pending installation/hardware acceptance and publication review.**
The application source remains in a separate private repository.

## Installation after publication

```sh
brew install --cask radeknovis/debagr/debagr
```

Requires Apple silicon and macOS 26 or later. The cask installs `Debagr.app`
and links its existing executable as `debagr`; no separate CLI is compiled.
The release DMG and nested app are Developer ID signed, notarized and stapled.
Homebrew verifies the versioned DMG's SHA-256 before installing it.

Open Debagr, complete USB pairing and trust, then configure the intended device
and private VPN. Keep the app running on the paired Mac. Remote deployment needs
Wi-Fi; cellular-only RemotePairing is unsupported. The preview supports one
configured remote device. iPad and additional VPN implementations have not
completed the current hardware acceptance matrix.

```sh
debagr --devices --json
```

The deployment skill is included at
`/Applications/Debagr.app/Contents/Resources/Skills/debagr-deploy/SKILL.md`.
Use the app's Agent tools to copy the prompt and reveal the skill folder.

## Update and uninstall

Quit Debagr before an upgrade; its relay pauses while the app is replaced.

```sh
brew update
brew upgrade --cask radeknovis/debagr/debagr
brew uninstall --cask debagr
```

Uninstall removes the app and Homebrew CLI link. This cask has no `zap` stanza:
it preserves device profiles, pairing records, preferences and deployment
receipts. Remove retained data only after reviewing it and making a backup.

## Direct download

After publication, download `Debagr-0.2.0.dmg` and its matching `.sha256` from
this repository's Releases. Source-code ZIPs contain the cask definition, not
the application. Verify the checksum, mount the DMG and drag Debagr to Applications.

## Maintaining the cask

For each approved release, upload the notarized/stapled versioned DMG and its
checksum as a draft release here. Update `version` and `sha256` in
`Casks/debagr.rb` using the final DMG; never use `:no_check`. Check `brew style`
and `brew audit --cask --strict`, then test install, replacement and uninstall.
Publish only after the app's acceptance checks and the public download URL pass.
Keep the previous versioned release available for rollback. The cask repository
contains no signing keys, notary credentials, pairing records or app source history.
