<br><div align="center">
    <img src="https://raw.githubusercontent.com/Potabi/potabi.com/images/logo.png" width="72" alt="The Potabi Systems Project by the Potabi Foundation.">
    <h1>Potabi Build System</h1>
    <h3>Potential and Ability. Pretty. Powerful.</h3>
    <h6>Compile System Management Document</h6>
</div><br>

<i>Copyright &copy; The Potabi Foundation;</i><br>
<i>Permission is hereby granted to modify, redistribute, and privately/commercially use this document for the Potabi Build Systems. The above copyright notice must be included in all redistributed versions of this document. This document does not need the original Potabi Build System source code included for redistribution.</i>

## Table of Contents
<!--
    For maintainers, please include the following in any chapter: <a name=""></a>. The name here sets what can be linked in the table of contents.
-->

This documentation is considered incomplete, however, is intentionally designed to contain any of the most important information for most developers.

### **Table of Contents:**
- [1: About the Potabi Build System](#1)
- [2: Getting Started](#2)
  - [2.1: How to run the script](#2.1)
    - [2.1.1: Full Explanation (Best for new/inexperienced users)](#2.1.1)
    - [2.1.2: The One-Liner](#2.1.2)
    - [2.1.3: The Quick Start Script](#2.1.3)
- [3: Changing the `src`](#3)
- [4. Adding packages from `pkg`](#4)
- [5. Adding software manually](#5)
- [6. What is mkiso?](#6)


----

## 1. About the Potabi Build System <a name="1"></a>
The Potabi Build system is a set of shell scripts designed to build the Potabi Operating System - a CoreNGS/FreeBSD based operating system. CoreNGS is our sister project, and is designed to be a replacement to FreeBSD for our purposes - but is not neccisarily required to be based on CoreNGS or FreeBSD.

While currently untested - reliably that is - we do intend to support the Potabi Build System for other BSD and Illumos-based projects for experimentation and simple fun. However, changes will need to be made in the chapter of this document [Changing the `src`](#3) as well as [Adding packages from `pkg`](#4) as this script is using FreeBSD/CoreNGS-specific package management.

This should be a rather easy-start for anyone intending on making a BSD/Illumos based system aside from Potabi. Uses of this document, for example, could be to make a graphical fork of NetBSD, create a system with which you can easily transfer your prefered desktop setup, with your applications, into something you can use if you ever get a new computer, etc.

The Potabi Systems project, Potabi Build System, and this document are made by the Potabi Foundation (https://foundation.potabi.com).

## 2. Getting Started <a name="2"></a>
If you simply want to jump in and get to know the basics of this builder without any modification, please read this.

### ***2.1. How to run the script*** <a name="2.1"></a>
To run the script and build your own Potabi ISO is actually quite simple - intentionally by design. We have two ways of running the script, first will be a detailed explanation of each command seperately (in `2.1.1`), a simple one-liner that will immediately start you off with a running system of Potabi (`2.1.2`), then lastly you will be provided a script which you can use to help you build Potabi using a shell script that lets you more quickly used a forked version of this script. (`2.1.3`). All of these instructions will be done via a terminal emulator (Currently the `xterm` application on Potabi Systems), or via a FreeBSD/CoreNGS command line interface. Linux is not recommended due to the differences in how certain commands work. MacOS is not recommended due to lack of testing. Windows is not recommended because of the difference in how the Windows command line functionally works.

#### ***2.1.1: Full explanation*** <a name="2.1.1"></a>
The Potabi Build System is ran with three commands. These will let you get then run the Potabi Build System source code as it is here. All new users are recommended to read this. This explanation is long. If you are an experienced user, please skip to `2.1.2` or `2.1.3`. 

First,  you will need to `git clone` the repository. To `git clone` means to grab from a git repository (which can be hosted on other sites using Git's technology). While many experienced engineers know what git is, not every user will, which is fine.

```
git clone https://github.com/potabi/potabi-build
```

Once you have cloned the repository, you need to change the current directory (`cd` in the terminal).

```sh
cd potabi-build
```

Finally, you will want to run the build script via the shell. This can be done by calling the `sh` command in your terminal, followed by the `build.sh` file name.

```sh
sh build.sh
```

Potabi aims to be a beginner-friendly distribution, and as long as the project is active, feel free to ask for help via the [GitHub issues](https://github.com/Potabi/potabi-build/issues), or [Potabi Foundation Discord Server](https://discord.com/invite/8s8nNwndtF).

#### ***2.1.2: The One-Liner*** <a name="2.1.2"></a>
If you need no introduction to how git, or the command line works, we have one of two options for you. This is the one-liner. Change it as you see fit.

```sh
git clone https://github.com/potabi/potabi-build && cd potabi-build && sh build.sh
```

Do not run the script with `sh potabi-build/build.sh` as the script will not function - with the current working directory system breaking whenever we tried to run this without changing the current directory.

#### ***2.1.3: The Quick Start Script*** <a name="2.1.3"></a>
The best thing about the quick start script is that it is 100% designed to support forks of the system, and is a better option when it comes to people making their own variations of CoreNGS/Potabi/FreeBSD/Illumos/etc and need a quick way to start a running script. As long as the script works and uses the script `build.sh` you have can use one of the two following options:

Pastebin: https://pastebin.com/raw/tdiMDUAU <br>
Gist: https://gist.github.com/loralighte/022cb43da8263c58eaaa54b429c200d2.

Using Pastebin: <br>
Pastebin can be grabbed with a Potabi/FreeBSD/CoreNGS default command known as `fetch`. Here is how we recommend doing that:
```sh
fetch -o quickstart.sh -q -R https://pastebin.com/raw/tdiMDUAU
sh quickstart.sh <options...>
```
If you fetch with the URL, it will still be executable with the name tdiMDUAU.
```sh
fetch https://pastebin.com/raw/tdiMDUAU
sh tdiMDUAU <options...>
```

Another command you can run is the wget command. This can be used if `fetch` is not available.
```
wget https://pastebin.com/raw/tdiMDUAU -o quickstart.sh
sh quickstart.sh <options...>
```

You can name the quickstart script however you wish, not just `quickstart.sh` but that is what is recommended.

If you are using Gist:
```
git clone https://gist.github.com/022cb43da8263c58eaaa54b429c200d2.git
sh 022cb43da8263c58eaaa54b429c200d2/potabi-quick-build.sh <options...>
```

Running the quickstart script requires three options in a specific order. First is the git host, as in what is the domain of the URL you are cloning from (i.e `github.com`) Second is the organization link (i.e `potabi`). If the git url does not include an organization, simply add `""` in the 2nd spot of the script. Lastly, you need the repo (i.e `potabi-build`)

Example (with organization):
```
sh quickstart.sh git.example.com yourorganization yourbuildsystem
```

Example (without organization):
```
sh git.example.com "" yourbuildsystem
```

## 3. Changing the `src` <a name="3"></a>
***Coming soon***

## 4. Adding packages from `pkg` <a name="4"></a>
***Coming soon***

```md
Temporary short-version (this will be replaced with a better version) in a later date.

In "src/packages" folder, you can find the current list of applications under "desktop.lumina.amd64". Add it by package name (what you would use running "pkg install <package>") on a new line within the file. No, the package file does not include comments in any form.
```

## 5. Adding software manually <a name="5"></a>
***Coming soon***

## 6. What is mkiso? <a name="6"></a>
***Coming soon***

----

<i>This document should be complete for most users. This documentation, and the software it helps creates comes without warranty. The disclaimer in the software license similarly applies to this documentation. This disclaimer is added below for your convenience.</i><br><br>
<strong><i>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</i></strong>