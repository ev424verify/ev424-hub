# EV424 Linux Installation

## Authority

CANONICAL_PUBLIC_ARCHIVE_SHA256=a2c25ebf2a6e35aaee326a9239f4cf9d3ab20b2f57704b4dbca5afdb47060b22
PUBLIC_ENTRYPOINT_SHA256=c84d734aee03bc9b0194738e07a8952aa4be8a51c0b297cfdcd1d3d79cfa5fdf
DIRECT_BINDING_SHA256=706ee9a7d49adb647c5d31fe50ccdf045442de16c2df155eadeb3fa5ee96ff77
HOST_ROOT_INSTALL_QUALIFICATION_FINAL_MANIFEST_SHA256=662ede834964b7cb1656071dee04491b393028cb43a1264acc0b16fca7efe311

## Qualified installation contract

- /opt/ev424/bin: root:root, mode 0755
- 7 executable payload files: root:root, mode 0755
- 2 read-only payload files: root:root, mode 0644
- /usr/local/bin/ev424: root:root, mode 0755
- /var/lib/ev424: same UID/GID as the EV424 runtime caller, mode 0755
- DIRECT_BINDING reproduction: PASS 10/10
- Launcher startup and Q exit smoke: PASS

## Scope boundary

- 문서역권중복검수 is an optional publication duplicate-inspection function and is excluded from third-party installation qualification.
- Kernel payload bytes must not be modified during installation.
- DOCW remains CLOSED_IMMUTABLE.

## Installation commands


Run this sequence as the EV424 runtime caller. The staging path must not already exist.

```bash
set -euo pipefail
/usr/bin/mkdir --mode=0755 -- /tmp/EV424_PUBLIC_INSTALL_V2
/usr/bin/curl --fail --location --silent --show-error --output /tmp/EV424_PUBLIC_INSTALL_V2/EV424_PUBLIC_LINUX_DISTRIBUTION_V2.tar.gz -- https://ev424verify.pages.dev/download/EV424_PUBLIC_LINUX_DISTRIBUTION_V2.tar.gz
/usr/bin/printf "%s  %s\n" "a2c25ebf2a6e35aaee326a9239f4cf9d3ab20b2f57704b4dbca5afdb47060b22" "/tmp/EV424_PUBLIC_INSTALL_V2/EV424_PUBLIC_LINUX_DISTRIBUTION_V2.tar.gz" | /usr/bin/sha256sum --check -
/usr/bin/mkdir --mode=0755 -- /tmp/EV424_PUBLIC_INSTALL_V2/extracted
/usr/bin/tar --extract --gzip --no-same-owner --file /tmp/EV424_PUBLIC_INSTALL_V2/EV424_PUBLIC_LINUX_DISTRIBUTION_V2.tar.gz --directory /tmp/EV424_PUBLIC_INSTALL_V2/extracted
cd /tmp/EV424_PUBLIC_INSTALL_V2/extracted
/usr/bin/sha256sum --check DIRECT_BINDING.sha256
/usr/bin/sudo /usr/bin/install --directory --mode=0755 --owner=root --group=root /opt/ev424/bin
/usr/bin/sudo /usr/bin/install --mode=0755 --owner=root --group=root --target-directory /opt/ev424/bin opt/ev424/bin/새문서전송사전검사 opt/ev424/bin/문서역권 opt/ev424/bin/문서역권2 opt/ev424/bin/문서역권3 opt/ev424/bin/문서역권4 opt/ev424/bin/문서역권5 opt/ev424/bin/새문서요청검증.PUBLIC_V7_EXECUTABLE_BINDING_SUCCESSOR_V1
/usr/bin/sudo /usr/bin/install --mode=0644 --owner=root --group=root --target-directory /opt/ev424/bin opt/ev424/bin/ev424.PUBLIC_V7_EVIDENCE_REVIEW_9ITEM_READ_ONLY_SUCCESSOR_V1 opt/ev424/bin/EV424_PUBLIC_V7_SINGLE_GAWK_CONSUMER_EVIDENCE_ID_TRANSPORT_HARD_CAP_REMOVAL_SUCCESSOR_V1_20260814T1756+0900.awk
/usr/bin/sudo /usr/bin/install --directory --mode=0755 --owner=root --group=root /usr/local/bin
/usr/bin/sudo /usr/bin/install --mode=0755 --owner=root --group=root usr/local/bin/ev424 /usr/local/bin/ev424
/usr/bin/sudo /usr/bin/install --directory --mode=0755 --owner="$UID" --group="${GROUPS[0]}" /var/lib/ev424
cd /
/usr/bin/sha256sum --check /tmp/EV424_PUBLIC_INSTALL_V2/extracted/DIRECT_BINDING.sha256
```
