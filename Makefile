# Deze vars worden nu niet gebruikt.
NAME = rijkszaak/openldap
VERSION = v23-snapshot

.PHONY: build test run

build:
	IMAGE_VERSION=$(VERSION) ./build-image.sh

run:
	docker run -itd --env-file rijkszaak/rijkszaak.env $(NAME)

test:
	test/test.sh
