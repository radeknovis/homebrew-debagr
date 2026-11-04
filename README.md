# Debagr for Homebrew

Publisher-owned Homebrew cask and binary release channel for Debagr, a native
macOS menu-bar app and JSON CLI for deploying signed iOS apps through their
paired Mac over a private VPN.

**Technical preview 0.2.0 for Apple silicon.**
[Website](https://radeknovis.github.io/debagr-site/) ·
[Release and downloads](https://github.com/radeknovis/homebrew-debagr/releases/tag/v0.2.0) ·
[Privacy, terms and support](https://radeknovis.github.io/debagr-site/legal.html).
The application source is not public; this repository holds the cask and
release binaries only.

## Installation

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

Download `Debagr-0.2.0.dmg` and its matching `.sha256` from the
[0.2.0 release](https://github.com/radeknovis/homebrew-debagr/releases/tag/v0.2.0). Source-code ZIPs contain the cask definition, not
the application. Verify the checksum, mount the DMG and drag Debagr to Applications.

## Support and security

Report problems in [Issues](https://github.com/radeknovis/homebrew-debagr/issues)
with the exact macOS, Xcode and iOS versions. Never post device identifiers,
hostnames, VPN addresses, pairing material or diagnostics in a public issue.
Send vulnerabilities, privacy requests and requested diagnostics through
[private vulnerability reporting](https://github.com/radeknovis/homebrew-debagr/security/advisories/new).
Support is best effort during the technical preview. See [SECURITY.md](SECURITY.md).

## Maintaining the cask

For each approved release, upload the notarized/stapled versioned DMG and its
checksum as a draft release here. Update `version` and `sha256` in
`Casks/debagr.rb` using the final DMG; never use `:no_check`. Check `brew style`
and `brew audit --cask --strict`, then test install, replacement and uninstall.
Publish only after the app's acceptance checks and the public download URL pass.
Keep the previous versioned release available for rollback. The cask repository
contains no signing keys, notary credentials, pairing records or app source history.

## Acceptance recorded for 0.2.0

- Homebrew style and strict audit passed.
- Temporary-appdir install, reinstall and uninstall passed using the final DMG
  through a local file URL. The pinned SHA-256 was enforced.
- The installed app and CLI link passed JSON inventory, strict signature,
  stapled-ticket and Gatekeeper checks after install and replacement.
- The temporary cask, CLI link, trust entry and tap were removed after testing.
- Authenticated download of the private draft DMG matched the local SHA-256.
- Anonymous public fetching, version-to-version upgrade, clean-Mac first launch
  and fresh remote-device acceptance remain open.
