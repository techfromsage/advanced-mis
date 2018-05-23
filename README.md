# Advanced MIS beta documentation

This repository contains end-user documentation for beta customers who are helping us develop our [Advanced MIS capability](https://github.com/talis/census-server)
of Talis Aspire. At some point these documents will probably be transitioned to the support site.

The site is designed to read like a book which is why it emphasises white space and doesn't look like a web app. Any
styling changes that promote this ethos are welcomed.

## How it works

This is a special GitHub pages repo, powered by Jekyll. The master is build automatically by GitHub and displayed at
https://talis.github.io/advanced-mis.

If you wish to make changes, create a branch and submit a pull request.

## Build & run locally

```
sudo apt-get install ruby-dev nodejs
git clone https://github.com/talis/advanced-mis.git
cd advanced-mis
bundle install
bundle exec jekyll serve
```

Now go to http://127.0.0.1:4000

If your running on a VM, start jekyll with the command

```
bundle exec jekyll serve --host 0.0.0.0
```

so that it binds to an address your host machine can access.

## Deploy

To deploy to http://talis.github.io, merge to `master`. Changes will be applied after a short wait.

## Contributing to the handbook

*Anyone* at Talis can contribute. This handbook is written by engineers, for engineers. However, when contributing or reviewing
the contributions of others, consider:

* Are you adding global knowledge, or is your topic specific to one or a small subset of projects?
* Are you adding accepted wisdom and practice, or just your own spin on things? Tip: A pull request widely shared
usually resolves this ;-)
* Is your contribution both concise and precise?

The [rules for merging to master](https://talis.github.io/topics/code-reviews.html) are the same as any other Talis repo.

### Style guide

* Read back what you have written, and try writing it again using half the words
* The site is designed to read like a book. Inline links should only point elsewhere in the guide. For external links
[use footnotes](http://kramdown.gettalong.org/syntax.html#footnotes)
* Keep markdown source strictly to 120 columns wide or less.


