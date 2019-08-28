# o11n-package-vrocontrolcenter

A collection of useful workflows to configure remote vRO instances via the Control Center API.

Once a standalone vRO appliance has started for the first time it needs to be configured via the controlcenter interface.
These workflows can do the tidious steps needed to get vRO ready to roll after its first boot.

Currently this package has workflows to:
* Configure vSphere SSO Authentication
* Set vRO Hostname
* Configure Logging levels and log rollover 
* Configure Log Insight integration
* Check server status.



## Try it out
Latest built packages can be found at [releases](https://github.com/dlinsley/o11n-package-vrocontrolcenter/releases)


## Building the Package
See [BUILD.md](BUILD.md) for details on building this package from source.

## Automating Build / Deployment
See the [ci](ci) folder for example Concourse pipelines