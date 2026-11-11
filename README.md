# toolchain-reduction

Reduces Swift toolchain bugs on GitHub-hosted Linux runners. Each `cases/<name>/run.sh` is one candidate, and the `reduce` workflow runs every candidate as its own job and prints a verdict: `REPRODUCES`, `PASSES` or `OTHER-FAILURE`. Records live in [swift-institute/Issues](https://github.com/swift-institute/Issues). A finished reduction moves there as a `swift-issue-<topic>` folder.
