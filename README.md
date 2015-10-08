### Android development environment for ubuntu 14.04 LTS

* Oracle Java JDK 7
* Android SDK r23
* Gradle 1.10

#### Create the container

```
docker build -t droidbld .
```

#### Run an interactive shell

```
docker run -i -t droidbld /bin/bash
```

#### Build a project from sources located under ~/Src/test

```
echo 'sdk.dir=/usr/local/android-sdk' >> local.properties
docker run -v ~/Src/test:/src -i -t droidbld /bin/bash -c "cd /src && ./gradlew assembleDebug"
```


#### Install

You can either pull from `docker pull ayvazj/android-dev`:

```
docker pull docker pull ayvazj/android-dev
```

```
docker run -i -t docker pull ayvazj/android-dev /bin/bash
```

or add it to your Dockerfile:

```
FROM docker pull ayvazj/android-dev
```

