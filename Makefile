www: content config.toml theme
	hugo -d www/

update:
	git submodule update --init
	cd themes/techdoc && git fetch && git reset --hard v0.9.3
	# remove cloud trackers for GDPR compliance
	sed -i -e '/^<script/d' themes/techdoc/layouts/partials/head.html
	rm -f themes/techdoc/layouts/partials/head.html-e
.PHONY: update

theme:
	test -f themes/techdoc/theme.toml || make update
.PHONY: theme

dev: theme
	hugo server -DEF --ignoreCache --disableFastRender

.PHONY: dev
