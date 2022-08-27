# build-tools

## History
This repository originated from [Chard Bury](https://github.com/chardbury), originally created to house proccesses and scripts to manage the Community Crucible fork of OneLife, this is intended to be our moditication of those tools. An archive of the repository, close to the state Chard had left it in before Community Crucible was deleted, can be found at https://github.com/twohoursonelife/archive-build-tools.

## Current
At this time, I am working through these scripts again with the goal of modularising them more and converting them to work with our setup.

All components of this repository are unstable and should not be relied upon at this time.

Currently setup to build against the update-build-tools branch of twohoursonelife/OneLife. Insert the following after necessary checkouts in BuildAndPostClients.sh
`git -C OneLife checkout update-build-tools;`

At the moment, I can successfully build the linux and windows clients and windows editor from master.
This can be done with `./scripts/BuildAndPostClients.sh windows linux client editor master` and is the equivalent to `./scripts/BuildAndPostClients.sh windows linux` thanks to default flag settings.

Building from a tag (with update bundles) and all posting of updates is untested and unlikely to work.

## Notes
Usage `./scripts/BuildAndPostClients client linux master`

Flags: *Not all are functioning at time of writing*
- Ref:
  - `master`: Build against master, distribution bundles only, no diffBundles
  - `tag`: Build against latest tag, generates diffBundles for all platforms
- App:
  - `client`:
  - `editor`:
- Platform:
  - `linux`: (Working as is)
  - `windows`: (Working, with intervention)
  - `macos`: (Not working)
- Release
  - `post`: Moves bundles to public downloads (Update release)
  - `unsigned`: Final package name will indicate it has not yet been signed. Used in automated deployment.
