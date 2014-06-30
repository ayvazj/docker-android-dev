### Android development environment for ubuntu 14.04 LTS

* Oracle Java JDK 7
* Android SDK r23
* Gradle 1.10

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

