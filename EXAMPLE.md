

## Démarrage du serveur

npm start


## Chargement d'un jeu de données

jq '.data' food-science.json|curl -v --proxy "" -X POST --data-binary @- "http://127.0.0.1:31976/save.ini"


## Récupération de plusieurs documents

echo '["ark:/67375/6H6-V8ZHH0QZ-3","ark:/67375/6H6-05XWMMSD-8","ark:/67375/6H6-05FM5LNG-3","ark:/67375/6H6-M1GG45GL-G"]' |curl -v -X POST -d @- "http://127.0.0.1:31976/load.ini"

## Récupération d'un seul document

curl -v --proxy "" -X GET "http://p-thouveni:31976/ark:/67375/6H6-VCVSQTGM-Z"


## Récupération de tous les documents

curl -v --proxy "" -X GET "http://p-thouveni:31976/flow.ini"

# Executino d'une routine 

curl -v --proxy "" -X GET "http://p-thouveni:31976/routines/distribute-by-interval.ini"
