SHELL := /bin/bash

.PHONY: install-test post-install uninstall-test customize decustomize

customize:
	mkdir ~/.nettenance
	mkdir ~/.nettenance/hosts
	mkdir ~/.nettenance/maneuvers
	mkdir ~/.nettenance/repository

decustomize:
	rmdir ~/.nettenance/hosts
	rmdir ~/.nettenance/maneuvers
	rmdir ~/.nettenance/repository
	rmdir ~/.nettenance

install:
	ln -sf `pwd`/usr/bin/do-in /usr/bin/do-in
	ln -sf `pwd`/usr/bin/remote-do /usr/bin/remote-do
	ln -sf `pwd`/usr/bin/remote-dop /usr/bin/remote-dop
	ln -sf `pwd`/usr/bin/remote-install /usr/bin/remote-install
	ln -sf `pwd`/usr/bin/remote-installp /usr/bin/remote-installp
	ln -sf `pwd`/usr/bin/rcp-dir /usr/bin/rcp-dir
	ln -sf `pwd`/usr/bin/rcp-dir /usr/bin/seek
	ln -sf `pwd`/usr/sbin/push-all /usr/sbin/push-all
	ln -sf `pwd`/usr/sbin/copy-credentials /usr/sbin/copy-credentials
	ln -sf `pwd`/usr/sbin/list-macs /usr/sbin/list-macs
	cp etc/bash_completion.d/nettenance /etc/bash_completion.d/
	mkdir -p /etc/nettenance
	cp -R etc/nettenance/* /etc/nettenance
	mkdir -p /usr/share/nettenance
	cp -R usr/share/nettenance/* /usr/share/nettenance
	mkdir -p /srv/nettenance/repository
	cp -R srv/nettenance/repository/* /srv/nettenance/repository


uninstall:
	rm /usr/bin/do-in
	rm /usr/bin/remote-do
	rm /usr/bin/remote-dop
	rm /usr/bin/remote-install
	rm /usr/bin/remote-installp
	rm /usr/bin/rcp-dir
	rm /usr/bin/seek
	rm /usr/sbin/push-all
	rm /usr/sbin/copy-credentials
	rm /usr/sbin/list-macs
	rm /etc/bash_completion.d/nettenance
	rm -rf /etc/nettenance
	rm -rf /usr/share/nettenance

