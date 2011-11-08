php app/console doctrine:schema:drop --force
php app/console doctrine:schema:update --force
php app/console doctrine:fixtures:load --append
