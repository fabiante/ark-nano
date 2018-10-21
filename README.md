# ark-nano 🦕

A minimal way to host your ark server with docker.

## Prequesites

Docker and some knowledge about it of course.

## Usage

### Build

Build the docker image from `Dockerfile`.

```
$ sudo docker build -t ark-nano .
```

### Firewall

Make sure your server allows the following traffic for incoming and outgoing connections:

|  Port |       Protocol       |
|:-----:|:--------------------:|
| 27015 |          UDP         |
|  7777 |          UDP         |
|  7778 |          UDP         |
| 27020 | TCP (RCON:-optional) |

Get more information at [ark.gamepedia.com](https://ark.gamepedia.com/Dedicated_Server_Setup#Network).

### Provide Persistence

You don't want to loose your saves on a docker rebuild.
Therefore a shared volume is recommended which persists your ark installation.
If anything is wrong with your installation you can extract the savegames over your host
and store them safely while you reset the container.

Simply create the directory.

```
$ mkdir /usr/games/ark-nano-volume
```

Your ark and steam installation will be saved there. It is also good practice to
backup this folder. If you don't have a backup solution yet you can use
[hendriku/ondrive-cloud-backup](https://github.com/hendriku/onedrive-cloud-backup).

Your saved content will be located under `/usr/games/ark-nano-volume/ShooterGame/Saved/SavedArks/`.

### Run the container

You can run the container via executing the following line.

```
$ sudo docker run -p 7778:7778/udp -p 7777:7777/udp -p 27015:27015/udp -p 27020:27020 -d -v /usr/games/ark-nano-volume:/usr/games/ark --name ark-nano ark-nano
```

It will take care of containers port forwarding, volume sharing and starting of the container.

Note: The startup process of an ARK: Survival Evolved server may take up to **half
an hour** depending on the available hardware. Time for necessary steam updates **not included**. Be very patient!

### Make maintenance easier

We have some optional terminal aliases you can use to check, stop or restart your server.

```
$ sudo ./ark-shortcuts.sh
```

You can check the aliases function via executing `$ ark-help`.

### Join your game

You will find your server via entering the name of it into the search bar.
Set your search category to *Unoffical Servers*.
Make sure you allow (or deny) password protected servers.

Happy Playing! 🦖

## License

GNU Public License - v3.0

Use this software for any purpose but don't hold anyone liable.
You are the only one who's responsible for the actions done with this software product.

Written by Fabian Terstegen, Hendrik Ulbrich © 2018
