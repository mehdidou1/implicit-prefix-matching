# Implicit-Prefix-Matching

[![Pharo P14](https://img.shields.io/badge/Pharo-P14-2c98f0.svg)](https://github.com/pharo-completion/implicit-prefix-matching)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/pharo-completion/implicit-prefix-matching/blob/master/LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/pharo-completion/implicit-prefix-matching/pulls)
[![Status: Active](https://img.shields.io/badge/status-active-success.svg)](https://github.com/pharo-completion/implicit-prefix-matching)

Implicit Prefix Matching is a code completion extension for Pharo that allows users to omit a package-inferred prefix when searching for classes, while falling back to the global namespace for unmatched input.

---

<img width="925" height="654" alt="ImplicitPrefixExpansion" src="https://github.com/user-attachments/assets/50942e94-0872-4b16-a84b-20db2f91aab8" />


---

```smalltalk
Metacello new
  githubUser: 'pharo-completion' project: 'implicit-prefix-matching' commitish: 'main' path: 'src';
  baseline: 'ImplicitPrefixMatching';
  load.
```
