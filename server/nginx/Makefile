image_tag := povilasb/nginx

image:
	docker build -t $(image_tag) .
.PHONY: image

container:
	docker run --name povilasb-nginx \
		-v /srv/www:/srv/www -p 80:80 \
		-d -t $(image_tag)
.PHONY: container
