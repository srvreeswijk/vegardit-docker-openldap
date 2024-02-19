# Deze vars worden nu niet gebruikt.
NAME = vegardit-ldap
VERSION = 1.0

.PHONY: build test run

build:
	DOCKER_AUDIT_IMAGE=0 ./build-image.sh

run:
	docker run -itd --env-file rijkszaak/rijkszaak.env vegardit/openldap

test:
	test/test.sh
