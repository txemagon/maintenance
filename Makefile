.PHONY: install-test uninstall-test customize decustomize

install-test:
	ln -sf `pwd`/usr/bin/do_in /usr/bin/do_in
	cp etc/bash_completion.d/nettenance /etc/bash_completion.d/
	mkdir -p /etc/nettenance
	cp -R etc/nettenance/* /etc/nettenance
	mkdir -p /usr/share/nettenance
	cp -R usr/share/nettenance/* /usr/share/nettenance

uninstall-test:
	rm /usr/bin/do_in
	rm /etc/bash_completion.d/nettenance
	rm -rf /etc/nettenance
	rm -rf /usr/share/nettenance

customize:
	mkdir ~/.nettenance

decustomize:
	rmdir ~/.nettenance
