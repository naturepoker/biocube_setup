# New machine setup script

Simple setup script for downloading &amp; compiling bio tools on a new machine.

Execute base setup script .sh files in an appropriate apt/dnf directory.  
The base setup script is meant to quickly get the background OS up and running with a standard suite of compilation tools and drivers specific to distros running each of the respective packaging systems.
Keep in mind they might require (especially the dnf one) some manual entry, as noted in each of the scripts as comments - I'll automate these away soon as well.
An example would be downloading the right Nvidia driver package one rpm-fusion is activated (there's really just two choices - default or legacy, but it will still be hardware specific).

Activating each of the script can be done via:

```bash
sh *_base_setup.sh
```
All the manual compilation targets for work tooling is called from a single unified directory at compilation_list/
The manual compilation script can be run on its own, provided the base distro is already set up with right compilaton and processing tools.

Base setup script will require sudo access. Compilation target script will require sudo access for installation, though most of their default targets are .local/bin 


