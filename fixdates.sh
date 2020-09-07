#!/bin/sh
cd "$(dirname "$0")"
find content -name \*.md -o -name \*.html | while read file
do
	git diff --name-only --cached | fgrep -qx "$file" || git diff --name-only | fgrep -qx "$file" || continue
	date="$(date -r "$file")"
	echo "$file $date"
	sed -i -e "s/^date: .*/date: $date/" "$file"
	rm -f "${file}-e"
done
