SHELL := /bin/bash

.PHONY: install-test post-install uninstall-test customize decustomize

install-test:
	ln -sf `pwd`/usr/bin/do_in /usr/bin/do_in
	ln -sf `pwd`/usr/bin/remote_do /usr/bin/remote_do
	ln -sf `pwd`/usr/bin/remote_dop /usr/bin/remote_dop
	ln -sf `pwd`/usr/bin/remote_install /usr/bin/remote_install
	ln -sf `pwd`/usr/bin/remote_installp /usr/bin/remote_installp
	ln -sf `pwd`/usr/sbin/push_all /usr/sbin/push_all
	cp etc/bash_completion.d/nettenance /etc/bash_completion.d/
	mkdir -p /etc/nettenance
	cp -R etc/nettenance/* /etc/nettenance
	mkdir -p /usr/share/nettenance
	cp -R usr/share/nettenance/* /usr/share/nettenance
	mkdir -p /srv/nettenance/repository
	cp -R srv/nettenance/repository/* /srv/nettenance/repository


uninstall-test:
	rm /usr/bin/do_in
	rm /usr/bin/remote_do
	rm /usr/bin/remote_dop
	rm /usr/bin/remote_install
	rm /usr/bin/remote_installp
	rm /usr/sbin/push_all
	rm /etc/bash_completion.d/nettenance
	rm -rf /etc/nettenance
	rm -rf /usr/share/nettenance

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
