### Android development environment for ubuntu 14.04 LTS

* Oracle Java JDK 7
* Android SDK r22.3
* Gradle 1.12

It also updates the SDK to android 19 (4.4.2) with platform tools and system images for that revision.

#### Install

You can either pull from `rharter/android`:

```
docker pull rharter/android
```

```
docker run -i -t rharter/android /bin/bash
```

or add it to your Dockerfile:

```
FROM rharter/android
```
