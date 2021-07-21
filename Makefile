all:
	docker build -t yangqinjiang/centos7-base:latest centos7-ssh
	docker build -t yangqinjiang/hadoop-base:latest base
	docker build -t yangqinjiang/hadoop-master:latest master
	docker build -t yangqinjiang/hadoop-slave:latest slave
	docker-compose build

run:
	docker-compose up -d
	echo "http://localhost:9870 for HDFS"
	echo "http://localhost:8088 for YARN"

down:
	docker-compose down
