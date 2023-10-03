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
To use cheat, just invoke `cheat` with a certain command as a argument. For
example, `cheat ls` will show various use cases of the `ls` command.  You can
specify regexps to search with as well (Example: `cheat .\*` to display all
pages) There are flags which can be passed to the command to configure how
info is outputted, The default behaviour is to output colorized info into
`less -RF`.  If `-c` is given before the command name (`cheat -c foobar`)
It will put text through the `cat` command. If `-t` is given, all ANSI
Escape Sequence Colorization will be removed. The way the set of pages cheat
references is updated is by passing the `-u` flag to the command.

## File Format
`cheat` gets info about commands from a single file (From now on refereed
to as the pagefile).  Which is set to `$HOME/.local/cheat/page` by Default.
This provides benefits from storing each page in it's own file, Mainly
reducing file overhead (59MB on disk -> 2.4MB).

The pagefile Dives itself into pages. Each page usually represents one command,
Although there may be multiple pages on a single command. The pagefile 
pages are separated by the titles of each page, Titles are specified via a
'[T]' at the beginning of the line, followed by any amount of text, 
The name of the page, and a semicolon at the end of the title.

A line may be marked as a comment, And displayed as grey in colorized text
by putting '#' at the start of the line.

## Configuration
cheat is configured by editing of it's source code. Colorization of pages is
specified by `ESC_` ANSI Escape sequence variables at the top of the source
code, followed by the pager and it's flags. And then the directories and
files cheat uses. If you wish to add your own set of pages to the pagefile,
It is recommend that you put your own section that downloads them and puts them
into the pagefile in the `update` function. Starting by getting the pages, and 
copying them to directory in `$TMPDIR`. Then catting them into the pagefile. 
`$PAGEFILE`

