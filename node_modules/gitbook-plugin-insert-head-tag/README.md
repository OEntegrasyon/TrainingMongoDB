# Insert tag in head for GitBook

To use the insert-head-tag in your Gitbook project, add the insert-head-tag plugin to the `book.json` file, and configure the tag you want to insert.

```
{
    "plugins": ["livere"],
    "pluginsConfig": {
        "insert-head-tag": {
            "tags": [
                "<script data-ad-client='ca-pub-4774215405699477' async src='https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js'>",
                "<link rel='shortcut icon' href='gitbook/images/favicon.ico' type='image/x-icon'>"
            ]
        }
    }
}
```

Then run `gitbook install` to download and install the plugin.
