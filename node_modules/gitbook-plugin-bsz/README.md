# gitbook-plugin-bsz

![](https://img.shields.io/npm/dt/gitbook-plugin-bsz.svg)

GitBook plugin. Add busuanzi analytics at page footer.

## Usage

Add it to your `book.json`:

```json
{
  "plugins": ["bsz"],
  "pluginsConfig": {
    "bsz": {
      "copyright": "By <em>wangding</em>",
      "markdown": false
    }
  }
}
```

or

```json
{
  "plugins": ["bsz"],
  "pluginsConfig": {
    "bsz": {
      "copyright": "[wangding](https://github.com/wangding)",
      "markdown": true
    }
  }
}
```
