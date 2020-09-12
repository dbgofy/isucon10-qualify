deploy: stop isuumo start

start:
	sudo systemctl start isuumo.go

stop:
	sudo systemctl stop isuumo.go

isuumo: *.go
	go build -o isuumo
