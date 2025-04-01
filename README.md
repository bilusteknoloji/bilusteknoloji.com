# bilusteknoloji.com

Official website. 2025

## Rake Tasks

```bash
rake build                                  # build site
rake console                                # run console
rake deploy                                 # deploy
rake new:post[title,publish_date,language]  # create blog post
rake run_server                             # run server
```

New blog post:

```bash
rake new:post["What is an API Gateway and Why Does It Matter?"]   # publish date is now, lang: en
rake new:post["What is an API Gateway and Why Does It Matter?","2025-04-01 12:42"]   # publish date April 1, 12:42, lang: en
```
