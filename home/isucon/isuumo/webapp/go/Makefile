deploy: stop isuumo start

start:
	sudo systemctl start isuumo.go

stop:
	sudo systemctl stop isuumo.go

isuumo: *.go
	go build -o isuumo

slow.log: /var/log/mysql/mysql-slow.sql
	mysqldumpslow -s t $< > $@
	cat $@ | slackcat -c slowlog
rotate:
	sudo rm -fr /var/log/mysql/mysql-slow.sql
	sudo systemctl restart mysql
