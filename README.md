cheat - Print useful info about a command
---
cheat is a utility designed with the intent to give users of it useful info
about commands. But, Unlike the UNIX command `man`, it's intent is to show
how a command can be used to complete tasks, rather then give a 
comprehensive guide on a command.

For example, Running the cheat command on the `cut` command will show
examples of the `cut` command being used to complete tasks, rather
then document the flags and options of the command.

`cheat` and it's idea is based off the website cheat.sh, although it doesn't
share any code from the project. It pulls info from the same databases and
is designed to replicate the base functionality of cheat.sh, while still
being portable.

The nature of offline storage provides benefits in that fetching info
from a directory is many times faster then doing so online. Although at the
cost of storage.

As of September of 2023, The full set of pages contains 2 Megabytes
of text. Spanning about 4000 pages.

The text of the code is licensed under the public-domain equivalent 0BSD License.

## Installation

The default install location for pages is "$HOME/.local/cheat"

```
git clone https://www.github.com/oliverkwebb/cheat`
./cheat/cheat -u
```

## Usage
To use cheat, just invoke `cheat` with a certain command as a argument for
example, `cheat ls` will show various use cases of the `ls` command.  You can
specify regexps to search with as well (Example: cheat '.\*' to display all
pages) There are flags which can be passed to the command to configure how
info is outputted, The default behaviour is to output colorized info into
`less -RF`.  If `-c` is given before the command name (`cheat -c foobar`)
It will put text through the `cat` command. If `-t` is given, all ANSI
Escape Sequence Colorization will be removed. The way the set of pages cheat
references is updated is by passing the `-u` flag to the command.

## File Format, Configuration, And Hacking
`cheat` gets info about commands from a single file (`$HOME/.local/cheat/page`
by Default). This provides benefits from storing each page in it's own file,
Mainly reducing file overhead (59MB on disk -> 2.4MB).

The file which contains the set of pages cheat pulls info from 
(From now on refereed to as the pagefile). Dives itself into pages
Each page usually represents one command, Although there may be multiple
pages on a single command. The pagefile is separated by the titles
of each page, Titles are specified via a '[T]' at the beginning of the line,
followed by the database it comes from, a slash, then the name of the page.

Text of the page is shown as either a comment, usually explaining what a
command does above a use case or a brief explanation of a command at the top
of the file. Or a command which requires no special formatting, and is usually
meant to be a 

An example below is how a cheat page for the command `cheat` *may* be
implemented.  Although the below page is not installed by default.
```
[T]foobar/cheat:
# cheat, show useful info about a command

# Show info about the ls command
cheat ls
# Show plain text info about the stat command
cheat -t stat
# Update cheat pages
cheat -u
```
### Configuration
