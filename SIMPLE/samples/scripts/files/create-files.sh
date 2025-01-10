#!/bin/bash
FILE=$1

echo "-- Criando arquivo."

FILE_CONTENT=$(cat <<-END
    This is line one.
    This is line two.
    This is line three.
    UPDATE 4.
END
)
echo "$FILE_CONTENT" > ./${FILE}

echo "-- Arquivo criado."

