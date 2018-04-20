# Make file for creating HTTPS SSL certificates
all: ssl/server.crt

# Create certificate authority private key
ssl/localhostCA.key:
	openssl genrsa -out ssl/localhostCA.key 2048

# Create certificate authority root SSL certificate
# imported by doing `System Keychain > File > Import`
ssl/localhostCA.pem: ssl/localhostCA.key
	openssl req -x509 -new -nodes -key ssl/localhostCA.key -sha256 -days 3650 \
		-out ssl/localhostCA.pem -config server.csr.cnf

# Create server's self signed cerificiate
ssl/server.csr:
	openssl req -new -sha256 -nodes -out ssl/server.csr -newkey rsa:2048 -keyout \
		ssl/server.key -config server.csr.cnf

ssl/server.crt: ssl/server.csr ssl/localhostCA.pem
	openssl x509 -req -in ssl/server.csr -CA ssl/localhostCA.pem -CAkey \
		ssl/localhostCA.key -CAcreateserial -out ssl/server.crt -days 3650 -sha256 \
		-extfile v3.ext

clean:
	rm -f ssl/*
