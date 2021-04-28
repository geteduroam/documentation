www: content config.toml theme
	./fixdates.sh
	hugo --enableGitInfo --destination www/
	touch www

update:
	git submodule update --init
	cd themes/techdoc && git fetch && git reset --hard v0.9.3
	# remove cloud trackers for GDPR compliance
	sed -i -e '/^<script/d' themes/techdoc/layouts/partials/head.html
	rm -f themes/techdoc/layouts/partials/head.html-e
.PHONY: update

upload: www
	aws --profile geteduroam s3 cp www s3://geteduroam-website/ --acl public-read --recursive --cache-control "public, max-age=3600, s-maxage=300, stale-while-revalidate=86400, stale-if-error=2592000"

theme:
	test -f themes/techdoc/theme.toml || make update
.PHONY: theme

dev: theme
	hugo server -DEF --ignoreCache --disableFastRender
.PHONY: dev
