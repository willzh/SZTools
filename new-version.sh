git add .
git commit -m "fix bugs"
git push origin master

git tag -m “” 1.0.23
git push origin 1.0.23

pod trunk push