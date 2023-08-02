#!/bin/sh

#Config Variables
CHEAT_PAGES_DIR=~/.local/cheat
RETURN_NO_INTERNET=3

#Initilize
ping -c1 8.8.8.8 > /dev/null || ( echo "No Internet Connection"; exit $RETURN_NO_INTERNET ) 
mkdir -p $CHEAT_PAGES_DIR/tmpdir
mkdir -p $CHEAT_PAGES_DIR/pages

#Clone Repos And Extract Pages

#tldr
echo "Cloning: TLDR"
git clone -q https://www.github.com/tldr-pages/tldr $CHEAT_PAGES_DIR/tmpdir/tldr
echo "TLDR: Extracing Pages"
mkdir -p $CHEAT_PAGES_DIR/pages/tldr/
mkdir -p $CHEAT_PAGES_DIR/tmpdir/tldr-cv
mv $CHEAT_PAGES_DIR/tmpdir/tldr/pages/common/* $CHEAT_PAGES_DIR/tmpdir/tldr-cv
mv $CHEAT_PAGES_DIR/tmpdir/tldr/pages/linux/* $CHEAT_PAGES_DIR/tmpdir/tldr-cv
echo "TLDR: Converting Pages"
for page in $(ls $CHEAT_PAGES_DIR/tmpdir/tldr-cv | sed 's/.md$//'); do
	awk '{gsub(/\{\{|\}\}/,""); gsub(/^[->]/,"#");\
	 gsub(/^`|`$/,""); if(expcmd==1){if($0 !~ /^\s*$/)\
	print $0;} else print $0; if($1 ~ /#/)expcmd=1;else expcmd=0;}' $CHEAT_PAGES_DIR/tmpdir/tldr-cv/$page.md > $CHEAT_PAGES_DIR/pages/tldr/$page
done
	
#cheat
echo "Cloning: cheat"
git clone -q https://github.com/cheat/cheatsheets $CHEAT_PAGES_DIR/tmpdir/cheat
echo "cheat: Extracting Pages"
rm -rf $CHEAT_PAGES_DIR/tmpdir/cheat/.git* $CHEAT_PAGES_DIR/tmpdir/cheat/vim-plugins
mkdir -p $CHEAT_PAGES_DIR/pages/cheat
mv $CHEAT_PAGES_DIR/tmpdir/cheat/* $CHEAT_PAGES_DIR/pages/cheat

#cheat_sheets
echo "Cloning: cheat.sheets"
git clone -q https://github.com/chubin/cheat.sheets $CHEAT_PAGES_DIR/tmpdir/cheat_pages
echo "cheat.sheets: Extracting Pages"
mkdir -p $CHEAT_PAGES_DIR/pages/cheat_sheets
mv $(find $CHEAT_PAGES_DIR/tmpdir/cheat_pages/sheets/ -maxdepth 1 -type f) $CHEAT_PAGES_DIR/pages/cheat_sheets

#Cleanup, Nuke `tmpdir/`
echo "Cleaning Up"
rm -rf $CHEAT_PAGES_DIR/tmpdir
