# Security policy

Debagr is a technical preview. Only the latest published release receives fixes.

## Reporting a vulnerability

Report privately through GitHub
[private vulnerability reporting](https://github.com/radeknovis/homebrew-debagr/security/advisories/new).
Do not open a public issue. Use the same private route for privacy requests and
for diagnostics a maintainer asks you to share.

Include the Debagr version, the macOS, Xcode and iOS versions, and steps to
reproduce. Redact device identifiers, hostnames, VPN addresses and pairing
material unless they are essential to the report.

Responses are best effort; the preview has no guaranteed response time.

## Remote access boundary

In 0.3.0, peer discovery on TCP 49388 and role sync on TCP 49389 run while Initial device pairing is open or a Builder or Client role is saved. Discovery replies are unauthenticated; see the release notes for their contents and pairing requirements. Remote deployment invocation relies on the
build Mac's SSH configuration: anyone who can run Debagr through SSH acts with
that macOS account's device-development privileges. Use public-key SSH,
least-privilege accounts and a private network such as Tailscale. Never expose
Remote Login directly to the internet.
