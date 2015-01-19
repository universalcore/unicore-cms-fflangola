#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsfflangola/locale

pot-create -o unicorecmsfflangola/locale/unicorecmsfflangola.pot unicorecmsfflangola/

declare -a arr=("eng_GB")

for lang in "${arr[@]}"
do
    mkdir -p "unicorecmsfflangola/locale/""$lang""/LC_MESSAGES"

    if [ ! -f "unicorecmsfflangola/locale/""$lang""/LC_MESSAGES/unicorecmsfflangola.po" ]; then
        msginit -l $lang -i unicorecmsfflangola/locale/unicorecmsfflangola.pot -o unicorecmsfflangola/locale/$lang/LC_MESSAGES/unicorecmsfflangola.po
    fi

    msgmerge --update unicorecmsfflangola/locale/$lang/LC_MESSAGES/unicorecmsfflangola.po unicorecmsfflangola/locale/unicorecmsfflangola.pot
    msgfmt unicorecmsfflangola/locale/$lang/LC_MESSAGES/*.po -o unicorecmsfflangola/locale/$lang/LC_MESSAGES/unicorecmsfflangola.mo
done
