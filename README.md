log-alerter
===========

A simple tool to listen for important log messages and alert a user.

**It currently only supports listening for the Covenant Eyes Windows client.**

Building
========

Get a recent version of GHC (it's been tested with GHC 7.8.4).
  * For Windows, use [MinGHC](https://github.com/fpco/minghc/blob/master/README.md).

Then run

```bash
cabal update
cabal sandbox init
cabal install --dependencies-only
cabal run # this will build and run, the binary is in the dist folder
```
