# EV424 Linux Installation

## Qualified environment

- Ubuntu 24.04
- Installation and kernel execution are separate.

## V3 identities

- Installer: `ev424-install-v3`
- Installer SHA-256: `874b2e03389d439621cafd1ef78d4e5198666b5b8c843dbe67b528d6c46b2f41`
- Archive: `EV424_PUBLIC_LINUX_DISTRIBUTION_V3.tar.gz`
- Archive SHA-256: `0556c6360d0abadb78828101fff5f7eb7f925c1fe0b8331af211c85773d1862c`

## One-command installation

```bash
/usr/bin/bash -c 'set -euo pipefail; p=$(/usr/bin/mktemp -- /tmp/ev424-install-v3.XXXXXXXXXX); trap '\''/usr/bin/rm -f -- "$p"'\'' EXIT; /usr/bin/curl --fail --location --silent --show-error --output "$p" -- https://ev424verify.pages.dev/download/ev424-install-v3; /usr/bin/printf "%s  %s\n" "874b2e03389d439621cafd1ef78d4e5198666b5b8c843dbe67b528d6c46b2f41" "$p" | /usr/bin/sha256sum --check --status; /usr/bin/chmod 0755 -- "$p"; /usr/bin/sudo -- "$p"'
```

The temporary installer is removed on exit.

The installer does not start the EV424 kernel automatically.

A successful installation ends with:

```text
NEXT: ev424
```

## Installer verification sequence

The V3 installer:

1. Downloads the V3 archive when no archive path is supplied.
2. Verifies the archive SHA-256.
3. Verifies `PORTABLE_DIRECT_BINDING.sha256`.
4. Runs dependency preflight before installation.
5. Requires:
   - `COMMON_RUNTIME_FINAL_STATE=PASS`
   - `DOCUMENT_VERIFICATION_FINAL_STATE=AVAILABLE`
   - `EVIDENCE_REVIEW_FINAL_STATE=AVAILABLE`
   - `DEPENDENCY_PREFLIGHT=COMPLETE_NONQUALIFYING_OBSERVATION`
6. Requires root installation authority.
7. Requires valid `SUDO_UID` and `SUDO_GID`.
8. Installs the V3 files.
9. Verifies installed SHA-256 identities and metadata.
10. Prints `NEXT: ev424`.

## Installation paths

- `/opt/ev424/bin`: root:root, mode 0755
- 8 executable files under `/opt/ev424/bin`: root:root, mode 0755
- 2 read-only files under `/opt/ev424/bin`: root:root, mode 0644
- `/usr/local/bin/ev424`: root:root, mode 0755
- `/var/lib/ev424`: mode 0755, bound to the `SUDO_UID` / `SUDO_GID` caller identity

## Run EV424

After installation completes:

```bash
ev424
```

## Scope boundary

- Installation does not equal kernel execution.
- Kernel payload bytes are verified during installation.
- DOCW remains `CLOSED_IMMUTABLE`.
- V1/V2 release files remain preserved as publication history.
- This V3 document remains a nonactive publication candidate until operating deployment verification is complete.
