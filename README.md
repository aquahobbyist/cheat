cheat - An offline version of cheat.sh
---
cheat is a utility designed with the intent to give users of it useful info
about commands. But, Unlike the UNIX command `man`, it's intent is to show
how a command can be used to complete tasks, rather then give a 
comprehensive guide on a command.

For example, Running the cheat command on the `cut` command will show
examples of the `cut` command being used to complete tasks, rather
then document the flags and options of the command.

`cheat` is based off the website cheat.sh, although it doesn't share any code
from the project. It pulls info from the same databases and is designed to
replicate the base functionality of cheat.sh, while still being portable.

The nature of offline storage provides benefits in that fetching info
from a directory is many times faster then doing so online. Although at the
cost of storage.

As of September of 2023, The fully installed database contains 77 Kilobytes 
of text. Spanning about 4000 pages. The space on disk is 49 Megabytes (EXT4).

The text of the code is licensed under the public-domain equivalent 0BSD License.

## Installation

The default install location for pages is "$HOME/.local/cheat"

```
git clone https://www.github.com/oliverkwebb/cheat`
./cheat/cheat -u
```

## Configuration
