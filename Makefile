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

whatlocks:
	@if [ -d .git ]; then \
		git ls-files -m \
			| sed 's/^/file: /; s/$$/ git status: modified/'; \
		git diff --name-only --cached \
			| sed 's/^/file: /; s/$$/ git status: staged/'; \
		if git rev-parse --verify HEAD@{upstream} >/dev/null 2>&1; \
		then \
			git diff --name-only HEAD@{upstream}..HEAD \
			| sed 's/^/file: /; s/$$/ git status: committed/'; \
		fi \
	else \
		echo "Not a git repository"; \
	fi
