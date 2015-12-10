SHELL := /bin/bash

.PHONY: install-test post-install uninstall-test customize decustomize

customize:
	mkdir ~/.nettenance
	mkdir ~/.nettenance/hosts
	mkdir ~/.nettenance/maneuvers

decustomize:
	rmdir ~/.nettenance/hosts
	rmdir ~/.nettenance/maneuvers
	rmdir ~/.nettenance

install-develop:
	ln -sf `pwd`/usr/bin/do-in /usr/bin/do-in
	ln -sf `pwd`/usr/bin/remote-do /usr/bin/remote-do
	ln -sf `pwd`/usr/bin/remote-dop /usr/bin/remote-dop
	ln -sf `pwd`/usr/bin/remote-install /usr/bin/remote-install
	ln -sf `pwd`/usr/bin/remote-installp /usr/bin/remote-installp
	ln -sf `pwd`/usr/bin/rcp-dir /usr/bin/rcp-dir
	ln -sf `pwd`/usr/bin/seek /usr/bin/seek
	ln -sf `pwd`/usr/bin/shatter /usr/bin/shatter
	ln -sf `pwd`/usr/bin/netrange /usr/bin/netrange
	ln -sf `pwd`/usr/bin/list-hosts /usr/bin/list-hosts
	ln -sf `pwd`/usr/bin/make-booklet /usr/bin/make-booklet
	ln -sf `pwd`/usr/sbin/push-all /usr/sbin/push-all
	ln -sf `pwd`/usr/sbin/copy-credentials /usr/sbin/copy-credentials
	ln -sf `pwd`/usr/sbin/list-macs /usr/sbin/list-macs
	ln -sf `pwd`/usr/sbin/awake /usr/sbin/awake
	ln -sf `pwd`/usr/sbin/host-scan /usr/sbin/host-scan
	cp etc/bash_completion.d/nettenance /etc/bash_completion.d/
	mkdir -p /etc/nettenance
	cp -R etc/nettenance/* /etc/nettenance
	mkdir -p /usr/share/nettenance
	cp -R usr/share/nettenance/* /usr/share/nettenance
	mkdir -p /srv/nettenance/repository
	cp -R srv/nettenance/repository/* /srv/nettenance/repository
	mkdir -p /var/nettenance
	chmod +x /var/nettenance
	mkdir -p /var/nettenance/scan
	chmod +rx /var/nettenance/scan
	mkdir -p /var/nettenance/known
	chmod +rx /var/nettenance/known
	cp etc/init.d/host-scan /etc/init.d/


install:
	cp -f usr/bin/do-in /usr/bin/do-in
	cp -f usr/bin/remote-do /usr/bin/remote-do
	cp -f usr/bin/rcp-dir /usr/bin/rcp-dir
	cp -f usr/bin/seek /usr/bin/seek
	cp -f usr/bin/shatter /usr/bin/shatter
	cp -f usr/bin/netrange /usr/bin/netrange
	cp -f usr/bin/list-hosts /usr/bin/list-hosts
	cp -f usr/bin/make-booklet /usr/bin/make-booklet
	cp -f usr/sbin/push-all /usr/sbin/push-all
	cp -f usr/sbin/copy-credentials /usr/sbin/copy-credentials
	cp -f usr/sbin/list-macs /usr/sbin/list-macs
	cp -f usr/sbin/awake /usr/sbin/awake
	cp -f usr/sbin/host-scan /usr/sbin/host-scan
	cp etc/bash_completion.d/nettenance /etc/bash_completion.d/
	mkdir -p /etc/nettenance
	cp -R etc/nettenance/* /etc/nettenance
	mkdir -p /usr/share/nettenance
	cp -R usr/share/nettenance/* /usr/share/nettenance
	mkdir -p /srv/nettenance/repository
	cp -R srv/nettenance/repository/* /srv/nettenance/repository
	mkdir -p /var/nettenance
	chmod +x /var/nettenance
	mkdir -p /var/nettenance/scan
	chmod +rx /var/nettenance/scan
	mkdir -p /var/nettenance/known
	chmod +rx /var/nettenance/known
	cp etc/init.d/host-scan /etc/init.d/host-scan

uninstall:
	rm /usr/bin/do-in
	rm /usr/bin/remote-do
	rm /usr/bin/rcp-dir
	rm /usr/bin/seek
	rm /usr/bin/shatter
	rm /usr/bin/netrange
	rm /usr/bin/list-hosts
	rm /usr/bin/make-booklet
	rm /usr/sbin/push-all
	rm /usr/sbin/copy-credentials
	rm /usr/sbin/list-macs
	rm /usr/sbin/awake
	rm /usr/sbin/host-scan
	rm /etc/bash_completion.d/nettenance
	rm -rf /etc/nettenance
	rm -rf /usr/share/nettenance
	rm -rf /var/nettenance
	rm /etc/init.d/host-scan
