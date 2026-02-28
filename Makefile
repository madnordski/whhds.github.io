# deploy to github
# init repo first

push:
	@git rev-parse --is-inside-work-tree >/dev/null
	git add -A
	git commit -m "update site" || true
	@git show --name-status --oneline -1
	git push

init:
	git init
	git remote add origin git@github.com:madnordski/whhds.github.io.git
