# potabi-build/conf/
Config files for Potabi.

DO NOT TOUCH: `general.conf`. \
The general config (`general.conf`) is vital to the build system, and lists all the files with directories and locations to all project source files. If you plan to change any of these, make sure you know what they are linking and why. Some like `isopath` and `liveuser` are more okay to change, but don't change anything you don't need to.

Feel free to modify `build.conf`. \
The build config (`build.conf`) is not system vital. Just know what you are changing, and do not change the variable names, just the contents within the quotes. Below is the build config variables.

**Build Config**
`basev`: Which source are you running. This will be later changed to sources of CoreNGS, rather than Potabi's original src builds which ended with b2_1.0a.
> Most fork makers will not need to change this, as they will then also need to change some code in `build.sh`. Don't change this if you are using this script specifically for Potabi-based builds.

`version`: Which version number you are making. In reality this could be anything. It doesn't matter what it is called. It is simply text added to the ISO name (`isopath` in `general.conf`).

`codename`: The name of the release. A code name is essentially a chapter title. For example, Ubuntu 22.04's code name is Jammy Jellyfish. Debian names its unstable releases Sid, after the evil kid from the first Toy Story movie. Linux Mint 20.2 is codenamed Uma. Go wild, use whatever naming scheme you want!
> Potabi code names are listed as the names of people I care about, first names only. Using real names, preffered names, dead names, nick names, I have a lot of names to use. If I am out of those, I just use random first names until I find somone new I care about.

`tag`: This sets the "tag" for packages, and making system files. This essentially allows to seperate things made for desktop versions of the platform from mobile and server. Can also be used for custom tags.
> Tags are used for package list files (`potabi-build/src/packages`). Make sure to add the tag, desktop, and platform (`tag`.desktop.platform). Example: `server.mate.amd64`.

`platform`: This sets the platform (architecture) of the system. I.e `riscv`, `armv8`, `amd64` (use instead of x86_64), `i386`, `aarch`, etc. As long as there is a mkiso file in `potabi-build/src/mkiso` with the given platform, and with the packages (`potabi-build/src/packages`) - at the end. tag.desktop.`platform`

`desktop`: This is the graphical environment. This can be named anything as long as a packages file for it exists (`potabi-build/src/packages`).
> This has to be the 2nd item in the file name. tag.`desktop`.platform.

`label`: This is the label for the ISO. 
> Potabi builds for publicly available experiments have a dedicated name. For experiments of Potabi, use `Potabi_Expr` as the label.