# Context

Creating an Internal Developper Platform (IDP) with Wasm as main artifact to leverage the computing plane.

IDP is what Platform Engineer build and maintain. Its coming from the Platform Engineering discipline.

# Goal

How far can we go with Wasm and Spinkube as computing plane for an IDP?

Could Spinkube be used as a replacement for traditional serveless service while also replacing long running Http server instance due to its very low cold start latency?

# Devlog

The devlog is a simple way for me to track the progress of this project so that it could be shared with fellow software developpers and software engineers. I'll use the devlog to capture decisions I make along with my thought process at the time.

[Devlog](./devlog.md)

# Scope

- [x] Local deployment
- [ ] Monitoring cluster performance
- [ ] Infrastructure as Code with Pulumi
- [ ] IDP features
  - [ ] NoSql data layer
  - [ ] Http server with Wasm computing
- [ ] Nodejs app
- [ ] Python/Go app
- [ ] Cloud deployment
  - [ ] Ephemeral environment
  - [ ] Production like environment
