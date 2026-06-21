public: content config.toml
	hugo --minify
	touch public

upload: public
	aws --profile geteduroam s3 cp public s3://geteduroam-website/ --acl public-read --recursive --cache-control "public, max-age=3600, s-maxage=300, stale-while-revalidate=86400, stale-if-error=2592000"
.PHONY: upload

dev:
	hugo server -DEF --ignoreCache --disableFastRender
.PHONY: dev
