---
title: Configuration
description: How to configure the Trigo Theme.
date: 2020-01-01
authors: FreeCAD
weight: 5
tags:
  - Config
cover:
  image: 1.webp
  caption: "a cover caption"
  alt: "a cover alternative title"
---

> [!WARNING]
> Trigo Theme is still in active development.
> The following documentation is not yet accurate or up-to-date.
> Have a question or feedback? Feel free to [open an issue](https://github.com/FreeCAD/website)!

Hugo reads its configuration from `hugo.yaml` in the root of your Hugo site.
The config file is where you can configure all aspects of your site.
Check out the config file for this site [`hugo.yaml`](https://github.com/FreeCAD/website/blob/main/config/_default/hugo.yaml) on GitHub to get a comprehensive idea of available settings and best practices.

## Navigation

### Menu

Top right menu is defined under the `menu.main` section in the config file:

```yaml {file="hugo.yaml"}
menu:
  main:
    - name: Documentation
      pageRef: /docs
      weight: 1
    - name: Blog
      pageRef: /blog
      weight: 2
    - name: About
      pageRef: /about
      weight: 3
    - name: Search
      weight: 4
    - name: GitHub
      weight: 5
      url: "https://github.com/FreeCAD/website"
      params:
        icon: github
```

## Footer

To modify the copyright text displayed in your website's footer, you'll need to create a file named `i18n/en.yaml`.
In this file, specify your new copyright text as shown below:

```yaml {file="i18n/en.yaml"}
copyright: "© 2024 YOUR TEXT HERE"
```

For your reference, an example [`i18n/en.yaml`](https://github.com/FreeCAD/website/blob/main/i18n/en.yaml) file can be found in the GitHub repository. Additionally, you could use Markdown format in the copyright text.

You can create dropdown menus by defining child menu items. Child menus appear when clicking on the parent menu item.

```yaml {file="hugo.yaml"}
menu:
  main:
    - identifier: sdk
      name: SDK
    - identifier: python
      name: Python ↗
      url: https://python.org
      parent: sdk
    - identifier: go
      name: Go
      url: https://go.dev
      parent: sdk
```

Child menu items need to specify the `parent` parameter with the parent's `identifier` value.

## Logo and Title

To modify the default logo, edit `hugo.yaml` and add the path to your logo file under `static` directory.
Optionally, you can change the link that users are redirected to when clicking on your logo, as well as set the width & height of the logo in pixels.

```yaml {file="hugo.yaml"}
params:
  navbar:
    displayTitle: true
    displayLogo: true
    logo:
      path: images/logo.svg
      dark: images/logo-dark.svg
      link: /
      width: 40
      height: 20
```

## Favicon

To customize the [favicon](https://en.wikipedia.org/wiki/Favicon) for your site, place icon files under the `static` folder to override the [default favicons from the theme](https://github.com/FreeCAD/website/tree/main/static):

{{< tree >}}
  {{< branch name="static" >}}
    {{< leaf name="android-chrome-192x192.png" >}}
    {{< leaf name="android-chrome-512x512.png" >}}
    {{< leaf name="apple-touch-icon.png" >}}
    {{< leaf name="favicon-16x16.png" >}}
    {{< leaf name="favicon-32x32.png" >}}
    {{< leaf name="favicon-dark.svg" >}}
    {{< leaf name="favicon.ico" >}}
    {{< leaf name="favicon.svg" >}}
    {{< leaf name="site.webmanifest" >}}
  {{< /branch >}}
{{< /tree >}}

At minimum, include `favicon.svg` in your `static` folder. This will be used as the default favicon for your site.

You can create an adaptive SVG favicon that responds to system theme preferences by using CSS media queries within the SVG itself, following the approach described in [Building an Adaptive Favicon](https://web.dev/articles/building/an-adaptive-favicon).

While `favicon.ico` is generally for older browsers, modern browsers support SVG favicons which are preferred for their scalability and small file size.
Use tools like [favicon.io](https://favicon.io/) or [favycon](https://github.com/ruisaraiva19/favycon) to generate additional favicon formats if needed.

## Theme Configuration

Use the `theme` setting to configure the default theme mode and toggle button, allowing visitors to switch between light or dark mode.

```yaml {file="hugo.yaml"}
params:
  theme:
    # light | dark | system
    default: system
    displayToggle: true
```

Options for `theme.default`:

- `light` - always use light mode
- `dark` - always use dark mode
- `system` - sync with the operating system setting (default)

The `theme.displayToggle` parameter allows you to display a toggle button for changing themes.
When set to `true`, visitors can switch between light or dark mode, overriding the default setting.

## Page Last Modification

The date of the page's last modification can be displayed by enabling the `params.displayUpdatedDate` flag. To use Git commit date as the source, enable also the `enableGitInfo` flag.

To customize the date format, set the `params.dateFormat` parameter. Its layout matches Hugo's [`time.Format`](https://gohugo.io/functions/time/format/).

```yaml {file="hugo.yaml"}
# Parse Git commit
enableGitInfo: true

params:
  # Display the last modification date
  displayUpdatedDate: true
  dateFormat: "January 2, 2006"
```

## Tags

To display page tags, set following flags in the config file:

```yaml {file="hugo.yaml"}
params:
  blog:
    list:
      displayTags: true
  toc:
    displayTags: true
```

## Page Width

The width of the page can be customized by the `params.page.width` parameter in the config file:

```yaml {file="hugo.yaml"}
params:
  page:
    # full (100%), wide (90rem), normal (1280px)
    width: wide
```

There are three available options: `full`, `wide`, and `normal`. By default, the page width is set to `normal`.

Similarly, the width of the navbar and footer can be customized by the `params.navbar.width` and `params.footer.width` parameters.

## FlexSearch Index

Full-text search powered by [FlexSearch](https://github.com/nextapps-de/flexsearch) is enabled by default.
To customize the search index, set the `params.search.flexsearch.index` parameter in the config file:

```yaml {file="hugo.yaml"}
params:
  # Search
  search:
    enable: true
    type: flexsearch

    flexsearch:
      # index page by: content | summary | heading | title
      index: content
```

Options for `flexsearch.index`:

- `content` - full content of the page (default)
- `summary` - summary of the page, see [Hugo Content Summaries](https://gohugo.io/content-management/summaries/) for more details
- `heading` - level 1 and level 2 headings
- `title` - only include the page title

To customize the search tokenize, set the `params.search.flexsearch.tokenize` parameter in the config file:

```yaml {file="hugo.yaml"}
params:
  search:
    # ...
    flexsearch:
      # full | forward | reverse | strict
      tokenize: forward
```

Options for [`flexsearch.tokenize`](https://github.com/nextapps-de/flexsearch/#tokenizer-prefix-search):

- `strict` - index whole words
- `forward` - incrementally index words in forward direction
- `reverse` - incrementally index words in both directions
- `full` - index every possible combination

To exclude a page from the FlexSearch search index, set the `excludeSearch: true` in the front matter of the page:

```yaml {file="content/docs/guide/configuration.md"}
---
title: Configuration
excludeSearch: true
---
```

## Search Index

To [block Google Search](https://developers.google.com/search/docs/crawling-indexing/block-indexing) from indexing a page, set `noindex` to true in your page frontmatter:

```yaml
title: Configuration (archive version)
params:
  noindex: true
```

To exclude an entire directory, use the [`cascade`](https://gohugo.io/configuration/cascade/) key in the parent `_index.md` file.

> [!NOTE]
> To block search crawlers, you can make a [`robots.txt` template](https://gohugo.io/templates/robots/).
> However, `robots.txt` instructions do not necessarily keep a page out of Google search results.

## Open Graph

To add [Open Graph](https://ogp.me/) metadata, you can:
- add values in the front-matter params of a page
- or add values in the Hugo configuration file

As a page can have multiple `image` and `video` tags, place their values in an array.
Other Open Graph properties can have only one value.

{{< tabs >}}
{{< tab "Page level" >}}

```md {file="mypage.md"}
---
title: "My Page"
params:
  images:
    - "/images/image01.jpg"
  audio: "podcast02.mp3"
  videos:
    - "video01.mp4"
---

Page content.
```
{{< /tab >}}

{{< tab "Site level" >}}
```yaml {file="hugo.yaml"}
params:
  images:
    - "/images/image01.jpg"
  audio: "podcast02.mp3"
  videos:
    - "video01.mp4"
```
{{< /tab >}}
{{< /tabs >}}