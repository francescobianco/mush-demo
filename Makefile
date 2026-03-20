
MUSH_DEMO_VERSION := $$(shell cat Manifest.toml | grep version | head -n 1 | awk -F '"' '{print $$2}')

push:
	@git add .
	@git commit -am "Updated at $$(date)" || true
	@git push

release: push
	@git add .
	@git commit -m "Update  version ${MUSH_DEMO_VERSION}" || echo "No changes to commit"
	@git tag -fa "v${MUSH_DEMO_VERSION}" -m "${MUSH_DEMO_VERSION}"
	@git push origin --tags -f
	@mush info mush-demo
