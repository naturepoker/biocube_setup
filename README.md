# New machine setup script

Simple setup script for downloading &amp; compiling bio tools on a new machine.

Execute base setup script .sh files in an appropriate apt/dnf/zypper directory.  

```bash
sh *_base_setup.sh
```
All the manual compilation targets for work tooling is called from a single unified directory at compilation_list/

Base setup script will require sudo access. Compilation target script will require sudo access for installation, though most of their default targets are .local/bin


