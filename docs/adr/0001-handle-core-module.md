# ADR 0001: Rename `handle::handle` Module to `handle::core`

## Status
Accepted

## Context
The Rust module `handle::handle` duplicated the name of its parent module, causing Clippy's `module_inception` lint to fail the build. The module exposes the task execution handle shared across modules, so the rename must preserve the public API for downstream code.

## Decision
Rename the module file to `src/handle/core.rs`, expose it as `handle::core`, and re-export `TaskHandle` and `CheckRc` at the `handle` namespace root. This resolves the lint while keeping existing consumers working through the re-exported types.

## Consequences
* Clippy no longer flags `module_inception` for the handle subsystem.
* Downstream modules now import `crate::handle::{TaskHandle, CheckRc}` instead of the duplicated path.
* Future additions should prefer unique module names to avoid similar lints.
