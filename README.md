# kairos-incus-agent-bundle

This is a [bundle](https://kairos.io/docs/advanced/bundles/) for [Kairos](https://kairos.io/) to install incus-agent service in a virtual machine instance of [Incus](https://linuxcontainers.org/incus/) ([Japanese doc](https://incus-ja.readthedocs.io/ja/latest/)).

## Usage

You can load this bundle with the blocks in the Kairos configuration file:

```
bundles:
- targets:
  - run://ghcr.io/hnakamur/kairos-incus-agent-bundle:v7.4.0
```
