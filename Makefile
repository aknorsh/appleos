SHELL=/bin/bash

.PHONY: all
all: /workspaces/appleos/AppleLoaderPkg
	cd /workspaces/appleos/kernel && make
	cd ~/edk2 &&\
	source edksetup.sh &&\
	cp /workspaces/appleos/target.txt ~/edk2/Conf/target.txt &&\
	build

/workspaces/appleos/AppleLoaderPkg:
	ln -s /workspaces/appleos/AppleLoaderPkg ./


