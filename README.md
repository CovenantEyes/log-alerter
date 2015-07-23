log-alerter
===========

A simple tool to listen for important log messages and alert a user.

**It currently only supports listening for the Covenant Eyes Windows client.**


Usage
=====

*Note: Be sure to run with *Admin Privileges*:*

```bash
./alerter
```

Building
========

Get a recent version of [stack](https://github.com/commercialhaskell/stack/releases/latest).

Then run

```bash
stack build
stack exec alerter
```
