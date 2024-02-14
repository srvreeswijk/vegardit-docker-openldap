NAME = vegardit-ldap
VERSION = 1.0

.PHONY: build test

build:
	DOCKER_AUDIT_IMAGE=0 ./build-image.sh


test:
	test/test.sh
