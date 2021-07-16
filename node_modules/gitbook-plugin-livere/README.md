# Livere integration for GitBook

To use the Livere plugin in your Gitbook project, add the livere plugin to the `book.json` file, along with your uid (you create a uid for livere by creating a new website on the [livere.com](https://livere.com/) website)

```
{
    "plugins": ["livere"],
    "pluginsConfig": {
        "livere": {
            "uid": "XXXXXXX"
        }
    }
}
```

Then run `gitbook install` to download and install the plugin.
