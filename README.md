# openmw-easy-script
Scripts to ease the preparation to play openmw.

# Requirements:

* Python 3
* Bash shell: can be [Git Bash](https://gitforwindows.org/) or [MSYS2](https://www.msys2.org/) on Windows, and the shell on Linux.
* [pyffi](https://github.com/niftools/pyffi) v2.2.2, can be installed by `pip3 install pyffi==2.2.2`.

# Usage

* Run `./openmw_easy.sh -r -f your/mods/directory` to rename the normal maps under all the subdirectory of `your/mods/directory` to `_n.dds`. 

* Run `./openmw_easy.sh -c -f your/mods/directory` to clean the shiny `nif` under all the subdirectory of `your/mods/directory`, it is an automated process of [this document](https://openmw.readthedocs.io/en/openmw-0.41.0/openmw-mods/convert_bump_mapped_mods.html).
