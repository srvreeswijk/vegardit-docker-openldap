#!/usr/bin/env bash


CONTAINER=$(docker run -itd --rm --env-file test/test.docker.env vegardit/openldap)
sleep 5
docker exec $CONTAINER ldapsearch -x -b o=acme,dc=example,dc=org -D uid=admin,o=acme,dc=example,dc=org -w SuperSecret

docker exec $CONTAINER /bin/sh -c '
AANTAL=$(ldapsearch -LLL -Y EXTERNAL -H ldapi:/// -b o=acme,dc=example,dc=org "objectClass=person" cn 2>/dev/null | grep cn | wc -l)
echo "Aantal = $AANTAL"
if [ $AANTAL -eq 3 ]
then
  echo "De test is geslaagd"
else 
  echo "Het aantal aangemaakt users is anders dan veracht, de test is gefaald."
  exit 2
fi
'

docker stop $CONTAINER
