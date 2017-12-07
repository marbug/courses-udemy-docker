# Docker editions #

[https://store.docker.com](https://store.docker.com)

Types of payment:
* Community Edition (CE)
* Enterprise Edition (EE)

Types of installs:
* Direct
* Mac/Win
* Cloud

## Installing Docker ##

### Installing on Windows 10 (Pro or Enterprise) ###

You need to install ["Docker for Windows" from the Docker Store](https://www.docker.com/docker-windows).

With this Edition I recommend using PowerShell for the best CLI experience. See more in the next few Lectures.

### Installing on Mac ###

You'll want to install [Docker for Mac](https://www.docker.com/docker-mac), which is great.

### Installing on Linux ###

Do *not* use your built in default packages like **apt/yum install docker.io** because those packages are old and not the Official Docker-Built packages.

I prefer to use the Docker's automated script to add their repository and install all dependencies: **curl -sSL https://get.docker.com/ | sh** but you can also install in a more manual method by following specific instructions on the Docker Store for your distribution, like [this one for Ubuntu](https://store.docker.com/editions/community/docker-ce-server-ubuntu).


| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
