---
title: "Locales and Multiple language"
description: How to configure locales and multiple languages in the Trigo Theme.
date: 2020-01-01
authors: FreeCAD
weight: 5
tags:
  - Languages
  - Example
  - Guide
---


> [!WARNING]
> Trigo Theme is still in active development.
> The following documentation is not yet accurate or up-to-date.
> Have a question or feedback? Feel free to [open an issue](https://github.com/FreeCAD/website)!


Trigo supports creating site with multiple languages using Hugo's [multilingual mode](https://gohugo.io/content-management/multilingual/).


## Enable Multi-language

To make our site multi-language, we need to tell Hugo the supported languages. We need to add to the site configuration file:

```yaml {file="hugo.yaml"}
defaultContentLanguage: en
languages:
  en:
    languageName: English
    weight: 1
  fr:
    languageName: Français
    weight: 2
  ja:
    languageName: 日本語
    weight: 3
```


## Manage Translations by Filename

Hugo supports managing translations by filename. For example, if we have a file `content/docs/_index.md` in English, we can create a file `content/docs/_index.fr.md` for French translation.

{{< tree >}}
  {{< branch name="content" >}}
    {{< branch name="docs" state="open" >}}
      {{< leaf name="_index.md" >}}
      {{< leaf name="_index.fr.md" >}}
      {{< leaf name="_index.ja.md" >}}
    {{< /branch >}}
  {{< /branch >}}
{{< /tree >}}

Note: Hugo also supports [Translation by content directory](https://gohugo.io/content-management/multilingual/#translation-by-content-directory).


## Translate Menu Items

To translate menu items in the navigation bar, we need to set the `identifier` field:

```yaml {file="hugo.yaml"}
menu:
  main:
    - identifier: documentation
      name: Documentation
      pageRef: /docs
      weight: 1
    - identifier: blog
      name: Blog
      pageRef: /blog
      weight: 2
```

and translate them in the corresponding i18n file:

```yaml {file="i18n/fr.yaml"}
documentation: Documentation
blog: Blog
```


## Translate Strings

To translate strings on the other places, we need to add the translation to the corresponding i18n file:

```yaml {file="i18n/fr.yaml"}
readMore: Lire la suite
```

A list of strings used in the theme can be found in the `i18n/en.yaml` file.


## Read More

- [Hugo Multilingual Mode](https://gohugo.io/content-management/multilingual/)
- [Hugo Multilingual Part 1: Content translation](https://www.regisphilibert.com/blog/2018/08/hugo-multilingual-part-1-managing-content-translation/)
- [Hugo Multilingual Part 2: Strings localization](https://www.regisphilibert.com/blog/2018/08/hugo-multilingual-part-2-i18n-string-localization/)
