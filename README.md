# racket project

[![Test](https://github.com/dannypsnl/racket-project/actions/workflows/test.yml/badge.svg)](https://github.com/dannypsnl/racket-project/actions/workflows/test.yml)
[![codecov](https://codecov.io/gh/dannypsnl/racket-project/branch/develop/graph/badge.svg?token=2BBJROO160)](https://codecov.io/gh/dannypsnl/racket-project)

### How to use

```sh
sh ./replace.sh $your_project_name $your_github_id $your_name
# or want to keep origin github_id and name
sh ./replace.sh $your_project_name

# commit
rm ./replace.sh && git add . && git commit -m "rename"
```
