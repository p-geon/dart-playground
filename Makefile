export NAME_CONTAINER=hyperpigeon/dart-base

build:
	docker build -f Dockerfile -t $(NAME_CONTAINER) .

define run
	docker run -it --rm \
		-v `pwd`:/work \
		$(NAME_CONTAINER) \
		$(1)
endef

void: ## docker/run, bash
	$(call run, /bin/bash)

dart:
	docker run -it --rm \
		-v `pwd`:/app \
		$(NAME_CONTAINER) \
		dart scripts/test.dart