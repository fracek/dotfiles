---
description: Update opencode to the latest release
agent: build
---

Update the opencode nix package release to the latest version.

Package location: `packages/opencode/default.nix`

1. Fetch the latest available version:

```
gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/anomalyco/opencode/releases
```

The release version is in the `tag_name` field.

2. Compare it with the `version` value in the definition. If it's the same, there is no need to update the package.
Notice that the tag starts with `v`, while in the package version we only store the version number.

3. If we need to update the package, edit the file changing the `src.hash` and `outputHash` fields to the empty string `""`.

4. Build the package using the `nix build -L .#opencode` command. You will receive an hash mismatch error like the following:

```txt
warning: Git tree '/home/fra/dotfiles' is dirty
source>
source> trying https://github.com/anomalyco/opencode/archive/refs/tags/v1.1.23.tar.gz
source>   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
source>                                  Dload  Upload   Total   Spent    Left  Speed
source>   0     0   0     0   0     0     0     0  --:--:-- --:--:-- --:--:--     0
source> 100 73083k 100 73083k   0     0 22327k     0   0:00:03  0:00:03 --:--:-- 24437k
source> unpacking source archive /build/download.tar.gz
error: hash mismatch in fixed-output derivation '/nix/store/64w4ax7npjw9amrv6fdh1nqilixxyidq-source.drv':
         specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
            got:    sha256-cvz4HO5vNwA3zWx7zdVfs59Z7vD/00+MMCDbLU5WKpM=
error: Cannot build '/nix/store/mhq9bcdlmhici16syi1n1c21s5nqzp6m-opencode-1.1.23.drv'.
       Reason: 1 dependency failed.
       Output paths:
         /nix/store/a28c0swqazxkwc7107kcg0pqws303c86-opencode-1.1.23
```

5. Replace the `src.hash` with the `got` hash in the error message.

6. Run the `nix build -L .#opencode` command again. This time we will also get an error message.

```txt
error: hash mismatch in fixed-output derivation '/nix/store/yrad09rrvdpy10lw5ddwj22nbvg36xzs-opencode-node_modules-1.1.23.drv':
         specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
            got:    sha256-WZauk7tIq+zpzsnmRpCSBQV3DChVUtDxd8kf2di13Jk=
error: Cannot build '/nix/store/5h07hazxr5s95iqasinqwifav3hbagr5-opencode-1.1.23.drv'.
       Reason: 1 dependency failed.
       Output paths:
         /nix/store/s9l5xla27cxsb7pzaknfdygdc0kbm9ap-opencode-1.1.23
```

7. Replace the `outputHash` with the value we got.

8. Run the build command again. This time it should work. If not, stop and tell the user.
