[![Dependabot Updates](https://github.com/bilusteknoloji/bilusteknoloji.com/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/bilusteknoloji/bilusteknoloji.com/actions/workflows/dependabot/dependabot-updates)
[![pages-build-deployment](https://github.com/bilusteknoloji/bilusteknoloji.com/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/bilusteknoloji/bilusteknoloji.com/actions/workflows/pages/pages-build-deployment)
![Version](https://img.shields.io/badge/version-0.1.22-orange.svg)

# bilusteknoloji.com

Official website. 2025

## Rake Tasks

```bash
rake build                                  # build site
rake console                                # run console
rake deploy                                 # deploy
rake new:post[title,publish_date,language]  # create blog post
rake release[revision]                      # release new version major,minor,patch, default: patch
rake run_server                             # run server
```

New blog post:

```bash
rake new:post["What is an API Gateway and Why Does It Matter?"]   # publish date is now, lang: en
rake new:post["What is an API Gateway and Why Does It Matter?","2025-04-01 12:42"]   # publish date April 1, 12:42, lang: en
```
