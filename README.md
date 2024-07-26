cheat - show use cases of a command
---

cheat is a POSIX shell script designed to replicate [cheat.sh][2] in a
offline manner.

---
How to...
- Install cheat
    ```
    git clone https://www.github.com/oliverkwebb/cheat && ./cheat/cheat -u
    ```
- Update page database for cheat
    ```
    cheat -u
    ```
- Show use cases of `rsync`
    ```
    cheat rsync
    ```
- View guide on learning `awk`
    ```
    cheat learn-awk
    ```
- Open page on `cpio` from source tldr
    ```
    cheat -d tldr cpio
    ```
- Print use cases of `cut` to stdout, colorized
    ```
    cheat -c cut
    ```
- Print use cases of `tar`, uncolorized
    ```
    cheat -tc tar
    ```
---
See Also:\
  [Bash Oneliner][1]\
  [cheat.sh][2]

Page Sources: (These account for 96.6% of the pages on cheat.sh)\
  [Learn X in Y Minutes][3]\
  [tldr][4]\
  [cheat.sheets][5]\
  [cheat][6]

[1]: https://onceupon.github.io/Bash-Oneliner/
[2]: https://github.com/chubin/cheat.sh
[3]: https://learnxinyminutes.com/
[4]: https://tldr.sh
[5]: https://github.com/chubin/cheat.sheets
[6]: https://github.com/cheat/cheat
