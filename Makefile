PROJECT := caddy

TEMP_DIR := /tmp/$(PROJECT)
DEB_FILE := $(PROJECT).deb

SSH_SERVER := localhost
SSH_PORT := 22

all: deb
deb:
	-rm -rf $(TEMP_DIR)

	chmod +x debian/opt/caddy/bin/caddy
	cp -a -r debian/ $(TEMP_DIR)
	chown -R root:root $(TEMP_DIR)

	dpkg --build $(TEMP_DIR) ./$(DEB_FILE)
deploy:
	scp -P $(SSH_PORT) ./$(DEB_FILE) $(SSH_SERVER):/tmp/$(DEB_FILE)
	ssh -p $(SSH_PORT) -t $(SSH_SERVER) sudo dpkg -i /tmp/$(DEB_FILE)
clean:
	-rm -f ./$(DEB_FILE)
