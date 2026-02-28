# deploy to github
# init repo first

push:
	@git rev-parse --is-inside-work-tree >/dev/null
	git add -A
	git commit -m "update site" || true
	git push

init:
	git init
	git remote add origin git@github.com:madnordski/whhds.github.io.git
