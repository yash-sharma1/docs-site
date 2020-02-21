# Binance Chain Documentation

This documentation site is automatically deployed to [https://binance-chain.github.io](https://binance-chain.github.io).

The main documentation is stored in the `docs` folder and is generated with [Mkdocs](https://www.mkdocs.org/).

## How to Change the Docs

- install `mkdocs`
- In most times, you only need to add new pages with links on existing pages, such as index.md 
or *.md in `api-reference` fold. These files are all `markdown` format.
- Once you finish the editing, run `mkdocs serve` in the `Binance-Chain` directory, then you can 
preview the site via http://127.0.0.1:8000/. 

## Generating HTTP API Markdown

Use the following command to generate the Markdown documentation for the HTTP API **from this repo's root directory**:
```bash
$ make build-markdown-http-docs
```

## Generating JavaScript SDK Markdown

In a **javascript-sdk** directory cloned in this repo's parent directory, use the `yarn build:docs` command to generate the file, then copy the generated file in `docs/jsdoc.md` over the existing `docs/api-reference/js-sdk/jsdoc.md`:

```bash
$ cp ./docs/jsdoc.md ../docs-site/docs/api-reference/js-sdk/jsdoc.md
```

## Generate swagger doc

```bash
$  swagger-codegen generate -i ./rpc-openapi.json  -l  html2   -o ./site/rpc-swagger
$  swagger-codegen generate -i ./swagger.json  -l  html2   -o ./site/api-swagger
```

