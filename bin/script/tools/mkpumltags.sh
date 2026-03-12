#!/bin/sh
# below commands are not works: 
#ctags -R --exclude={.metadata,.svn,.git} --languages=plantUML --langmap=plantUML:.puml.plantuml
FILE_LIST=$(find . \
    ! \( -type d -path './_outputs' -prune \) \
    ! \( -type d -path './_TEMPELTE' -prune \) \
    ! \( -type d -path './_DISCARDED' -prune \) \
    -type f -name '*.puml')
for files in $FILE_LIST
do
    echo $files
done

echo "ctags" $FILE_LIST
ctags $FILE_LIST
