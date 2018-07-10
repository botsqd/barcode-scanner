dockerize:
	REV=$$(git rev-parse --short HEAD);\
	BASE=gcr.io/botsquad1/$$(basename $$PWD);\
	echo "*** Building: $$BASE:$$REV";\
	docker build -t $$BASE:$$REV .;\
	docker tag $$(docker images -q $$BASE:$$REV) $$BASE:latest;\
	docker push $$BASE:$$REV;\
	docker push $$BASE:latest
