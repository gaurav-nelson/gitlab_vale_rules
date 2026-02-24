# GitLab Vale rules

Collection of Vale linter rules tailored for GitLab's writing guidelines.

This repository contains Vale rule sets and configuration YAML files used to enforce consistent style and editorial standards across GitLab documentation.

## Upstream source

These rules are derived from and synchronized with content in the official GitLab monorepo:

- https://gitlab.com/gitlab-org/gitlab

Where possible, source rules should be traceable to their upstream location in `gitlab-org/gitlab`.

## Repository structure

- `gitlab_base/` — Core Vale rules and wordlists derived from GitLab's general style and product documentation.
- `gitlab_docs/` — Vale rules specific to the GitLab Docs site and its editorial conventions.
- `download_vale_rules.sh` — Script to download or refresh Vale rules (documented below).
- `package_release.sh` — Script to package or release rule sets (documented below).

## Licensing and attribution

This repository contains derived/adapted material from the official `gitlab-org/gitlab` project.

GitLab's upstream `LICENSE` describes multiple license scopes, including:

- `doc/` content under **CC BY-SA 4.0**.
- `ee/` content under `ee/LICENSE` (not included here).
- Remaining applicable content generally under **MIT Expat**.

Upstream license references:

- Main LICENSE: https://gitlab.com/gitlab-org/gitlab/-/blob/master/LICENSE
- EE LICENSE reference (for completeness): https://gitlab.com/gitlab-org/gitlab/-/blob/master/ee/LICENSE

Local compliance references in this repository:

- `NOTICE` (upstream attribution and redistribution notice)
- `LICENSES.md` (license mapping and canonical license text URLs)
- `LICENSE` (MIT license for original contributions in this repository)

For this repository:

- Rules and wordlists copied or adapted from GitLab documentation/style sources must retain applicable upstream attribution and license obligations.
- No proprietary GitLab EE source code is intended to be included in this repository.
- When redistributing this repository (or substantial portions), include this README and preserve all required upstream notices.
- Original material authored directly in this repository is licensed under the root `LICENSE` file unless otherwise noted.

If you need strict legal certainty for a specific file, verify that file's origin path in `gitlab-org/gitlab` and apply the corresponding upstream license terms.

## Disclaimer

This repository is an independent, community-maintained collection of Vale rules and is not affiliated with, endorsed by, or officially connected to GitLab Inc. The rules may be informed by GitLab's publicly available documentation and style guidance, but they are created and maintained separately. Use them at your own discretion.