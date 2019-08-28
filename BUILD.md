## Dependencies:
 * Java JDK 8 or greater
 * [Maven](https://maven.apache.org/) 3.0.4 or greater
 * Access to `vco-repo` on either:
     * Standalone vRO appliance:  https://`vrohost`:8281/vco-repo
     * From a running container of [docker-o11n-repo](https://github.com/dlinsley/docker-o11n-repo)
     * Using [docker-o11n-maven](https://github.com/dlinsley/docker-o11n-maven) container for offline maven builds.


## Building the Package
### Build options

For all of the following examples, the following maven properties can be overridden at build time:
* `repoUrl` - The URL to the vco-repo used by maven<br>
    Example:  `-DrepoUrl=https://<yourvRO>:8283/vco-repo`

    To accept self signed certificates for `https` repos add: `-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true`

* `vco.verison` - The version of the vRO appliance the vco-repo URL points to.<br>
    Example for vRO 7.4:  `-Dvco.verion=7.4.0`<br> 
    Example for vRO 7.6:  `-Dvco.verison=7.6.0`

* `allowedMask` - The permissions allowed for objects in the built package.  By default full access is `vef` where each letter represents:<br>
    `v` - elements can be viewed<br>
    `e` - elements can be edited<br>
    `f` - elements can be added to other packages<br>
    Example for creating a readonly package: `-DallowedMask=vf`



### Build Examples
From the root of the project:

#### Using vco-repo from standalone appliance
```bash
    mvn package -DrepoUrl=https://<yourVRO>:8283/vco-repo -Dvco.verison=7.6.0 \
    -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true
```

#### Using hosted docker-o11n-repo and creating a read only package
```bash
    mvn package -DrepoUrl=http://<yourDockerHost>:8080/vco-repo -Dvco.verison=7.6.0 -DallowedMask=vf
```


### Package Signing Certificate Generation
You should create your own package Signing Certificate for your project or organization.  The JDK provides the `keytool` command to create one.

To create a self signed certificate for package signing that is good for 10 years:

``` bash
keytool -genkeypair \
-alias _dunesrsa_alias_ \
-keyalg RSA \
-keysize 2048 \
-sigalg SHA512withRSA \
-storetype JCEKS \
-keystore package-signing-cert.jks \
-storepass password \
-dname "CN=Pkg Sign Team,OU=Org,O=Company,C=Country" \
-ext eku=sa \
-ext ku:c=dig,keyEncipherment \
-validity 3650
```

Make the certificate unique by updating the distinquished name (`-dname`), keystore password (`-storepass`)