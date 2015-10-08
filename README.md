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
docker run -v ~/Src/test:/src -i -t droidbld /bin/bash -c "cd /src && ./gradlew assembleDebug"
```


#### Install

You can either pull from `bprodoehl/android-dev`:

```
docker pull bprodoehl/android-dev
```

```
docker run -i -t bprodoehl/android-dev /bin/bash
```

or add it to your Dockerfile:

```
FROM bprodoehl/android-dev
```

