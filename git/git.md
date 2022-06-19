git status -s
git commit -a -m

git log -p -2

Git log -pretty=oneline, short, full, fuller

Useful specifiers for git log --pretty=format e.g git log --pretty=format:"%h - %an, %ar : %s"

git log --pretty=format:"%h %s" --graph

git log --since=2.weeks

git log -S function_name

git log -- path/to/file

--no-merges // hides merge commits in log output

git commit -m 'Initial commit'
git add forgotten_file
git commit --amend

git config --global pull.rebase "true"

git tag -l "v1.8.5\*"

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit

https://git-scm.com/docs/git-switch

git branch --move bad-branch-name corrected-branch-name
git push --set-upstream origin corrected-branch-name
git push origin --delete bad-branch-name

git merge @{u}

git shortlog -sn

git rebase --onto master server client

One of the most useful git commands I will never ever remember:

git remote set-head origin -a

Source: https://twitter.com/_myitcv/status/1361645617819357185?s=19
