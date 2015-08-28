#!/bin/sh
# 
# print line counts for current go project
#
for pkg in $(go list ./...); do
    wc -l $(go list -f '{{range .GoFiles}}{{$.Dir}}/{{.}} {{end}}' $pkg) | \
        tail -1 | awk '{ print $1 " '$pkg'" }'
done | sort -nr
