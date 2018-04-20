# Make file for creating HTTPS SSL certificates
all: server.crt

# Create certificate authority private key
localhostCA.key:
	openssl genrsa -out localhostCA.key 2048

# Create certificate authority root SSL certificate
localhostCA.pem: localhostCA.key
	openssl req -x509 -new -nodes -key localhostCA.key -sha256 -days 3650 -out \
		localhostCA.pem -config server.csr.cnf
	# imported by doing `System Keychain > File > Import`

# Create server's self signed cerificiate
server.csr:
	openssl req -new -sha256 -nodes -out server.csr -newkey rsa:2048 -keyout \
		server.key -config server.csr.cnf

server.crt: server.csr localhostCA.pem
	openssl x509 -req -in server.csr -CA localhostCA.pem -CAkey localhostCA.key \
		-CAcreateserial -out server.crt -days 3650 -sha256 -extfile v3.ext

clean:
	rm localhostCA.key localhostCA.pem localhostCA.srl server.csr server.key server.crt
