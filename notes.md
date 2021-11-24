General notes and ideas for mid-development crap.

MAKE SURE TO SET DATE BEFORE RUNNING SCRIPT

Getting port packages
```sh
git clone https://github.com/potabi/ports
cd ports/x11/lumina
make package
cd ports/x11/lumina-core
make package
cd ports/x11/lumina-coreutils
make package
```

Port `-y` equiv
```sh
make install clean BATCH=yes
```

Read ports list
```sh
cat /path/to/list
while read line
do
    # stuff
done
```

Install ports
```sh
pkg install -y ncurses
portsnap fetch extract
mkdir -pv /usr/ports/distfiles
```