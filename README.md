# openmw-easy-script
Scripts to ease the preparation to play [OpenMW](https://openmw.org/en/).

# Requirements:

* Python 3
* Bash shell: can be [Git Bash](https://gitforwindows.org/) or [MSYS2](https://www.msys2.org/) on Windows, and the shell on Linux.
* [pyffi](https://github.com/niftools/pyffi) v2.2.2, can be installed by `pip3 install pyffi==2.2.2`.

# Usage

First, make sure that you do not have `'` in the folder path of all of your mods. Please backup your mod files before running this script.

* Run `./openmw_easy.sh -r -f your/mods/directory` to rename and copy the normal maps under all the subdirectory of `your/mods/directory` to `_n.dds`. 

* Run `./openmw_easy.sh -c -f your/mods/directory` to clean the shiny `nif` under all the subdirectory of `your/mods/directory`, it is an automated process mentioned in [this document](https://openmw.readthedocs.io/en/openmw-0.41.0/openmw-mods/convert_bump_mapped_mods.html). Warning: please only run this on the mods you think it has shiny meshes, not all the mods with texture effect cause the shiny problem.
