docker run --name ci_docker_db_1 -v /home/ci/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=GreenRooster7829 -d -p 3306:3306 ci-docker-db
