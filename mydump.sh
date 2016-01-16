#!/bin/bash
# Bruce Emmanuel Sueira <bruce.dts@gmail.com>
# 29/11/2013 - Belo Horizonte / MG
# Script para backup logico de base de dados Mysql
# Version 1.0

# usuário e senha do Mysql
USER=""
PASS=""
# Nome do Banco de dados
DB=""
# Endereço ip ou nome do servidor Mysql
HOST="localhost"
# Email ou identificador do usuário que tenha uma chave GPG no sistema
USER_GPG="false"
DATE=$(date +%s);
FILE="$DB-$DATE-sql"

# Cria o dump do banco de dados
mysqldump --opt -h$HOST -u$USER -p$PASS $DB > $FILE;

if [ $USER_GPG != false ]
then
	gpg -r $USER_GPG -e $FILE
else
	tar -cvzf $FILE.tar.gz $FILE;
fi;

rm $FILE;
