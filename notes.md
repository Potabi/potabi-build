General notes and ideas for mid-development crap.

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