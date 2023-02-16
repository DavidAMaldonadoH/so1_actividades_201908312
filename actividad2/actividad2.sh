#!/bin/bash

curl "https://api.github.com/users/${GITHUB_USER}" > info.json 2> /dev/null 
user_id="$(grep -Po '"id": *\K[0-9]+' info.json)"
created_at="$(grep -Po '"created_at": *\K"[^"]*"' info.json)"
created_at="$(sed -e 's/^"//' -e 's/"$//' <<<"$created_at")"
msg="Hola ${GITHUB_USER}, User ID: $user_id. Cuenta creada el $created_at."
echo "$msg"
rm info.json

directory="logs/$(date +%Y-%m-%d)"

mkdir -p "$directory"
touch "$directory/saludos.log"
echo "$msg" > "$directory/saludos.log"