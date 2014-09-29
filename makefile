
VERSION=1.3.0
REPO=zenoss/pylibmc:$(VERSION)
TGZ=pythonlib-mc-$(VERSION)-centos7-x86_64.tgz

build/$(TGZ):
	docker build -t $(REPO) .
	rm -f .dockerid
	docker run --cidfile=.dockerid $(REPO) /bin/true
	docker cp `cat .dockerid`:/$(TGZ) build
	rm .dockerid
	touch $@

clean:
	rm -f .dockerid
	rm -Rf build

