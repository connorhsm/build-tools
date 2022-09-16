## Goals and plans for overall 2HOL CI/CD
This repo is the heart of 2HOL automation, with other workflows sitting in relevant repos.

### Backlog of ideal features

#### Workflow to create tags (initiate main release)
When it is decided to create a new release or pre-release (beta test) a workflow can be manually initiated to tag the three core repos. This tag should initiate another repo listening for release and pre-release tags which then handles the main build and release process.

#### Update download server download links
Following a release, push github asset download links to download servers. Likely will take some modification of the download server. Download server should just have a static link for each platform that we can throw up on the website or anywhere else, such as twohoursonelife.com/download/linux etc. which will then either serve the binary from github or just redirect to github download.

On a release, workflow will push new links to download server via some request mechanism, probably on download server side.

#### Directory depth
These scripts seem to add an additional directory to the full build. The final package is named after the platform, which contains a directory which contains the game. Remove the middle directory during packaging.

#### Packaging for binary signing
DONE

~~Optional flag for BuildAndPostClients.sh to skip packaging and keep binaries separate to fit in with our manual binary signing process.
Flag can be 'signing-export' which will output the game environment to the same location, but not archived and binaries into a new output directory 'binaryBuilds' named as unsigned.~~

After technical research, this will be too difficult to implement. It would be better to change the signing process.

Once the distributions are uploaded, to sign we'll download and extract each one, sign the binary and then reupload only the binary as an asset to the draft release. Another workflow will trigger upon this, download all assets, unpackage the dists. and replace the relevant binary with the signed binaries then repackage and reupload to the release.

- Updated to upload exe already, instead of unzipping locally.
- Workflow will trigger upon release publish, if its an unrelated release or the signed exe was not uploaded, there is an early safety check to fail the job early, which can be manually rerun after the signed exe is uploaded


#### Handle update bundles
Build script should handle update bundles also
These should also be uploaded as assets
Do the windows ones need to be signed?

#### Build and release editor
Editor should also be released for Windows and maybe Linux.
Ideally this would be a plug and play dev environment of some sort.

#### Build from tag, not master
Build from the most recent tag, not master.
Why when building from master, is it selecting tag 20291 as the name for the release? It should at least be the most recent tag and if not, a master tag.
Probably related to tag formatting in the build scripts.

#### Matrix for main release instead of duplication
on the can

#### Overall process
Add a new workflow

"release-version.yml"

If someone wants to release a new version, they workflow_dispatch this workflow.

For a full release, it will bump the binary version in OneLife/gameSource and data version in OneLifeData7 (via commits)

It will then tag OneLife, OneLifeData7 and minorGems with the next version (2HOL_v20293 -> 2HOL_v20294)

The current main build workflow will then trigger on the success of this workflow

For a beta release, I'm unsure if this will need a separate workflow or if we could somehow indicate it will be a beta release via workflow_dispatch
In the case of beta though, the two version bumps should not be committed, but only updated during the build process.
A beta tag will be created such as 2HOL_v20294-beta.1, given this is the first beta version following 2HOL_v20293