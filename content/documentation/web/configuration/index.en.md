---
title: Site and Theme Configuration
description: How to configure the site with the Trigo Theme.
date: 2020-01-01
authors: FreeCAD
weight: 4
tags:
  - Config
  - Theme
  - Guide
cover:
  image: 1.webp
  caption: "a cover caption"
  alt: "a cover alternative title"
---

> [!WARNING]
> Trigo Theme is still in active development.
> The following documentation is not yet accurate or up-to-date.
> Have a question or feedback? Feel free to [open an issue](https://github.com/FreeCAD/website)!

Hugo reads its configuration from `hugo.yaml` (or files in the `config` directory) in the root of the Hugo site project to configure all aspects of the site and theme-related options.
Check out the config file for this site [`hugo.yaml`](https://github.com/FreeCAD/website/blob/main/config/_default/hugo.yaml) to get a comprehensive idea of available settings and best practices.


## Title

To modify the title of the site, edit `hugo.yaml` (or `config/_default/hugo.yaml`) and add the title of the site.

```yaml {file="hugo.yaml"}
title: My awesome site
```


## Description, keywords and authors

To modify the description, keywords and authors of the site, edit `hugo.yaml` (or `config/_default/params.yaml`) and add the description, keywords and authors of the site.

```yaml {file="hugo.yaml"}
params:
  description: The description of my awesome site
  keywords:
    - Awesome
    - Beautiful
    - Magic
  authors: John Doe
```

For multi-lingual sites, the description can be localized in `hugo.yaml` (or `config/_default/languages.yaml`):

```yaml {file="hugo.yaml"}
es:
  languageName: Español
  params:
    subtitle: La descripción de mi fantástico sitio web
```


## Logo

To modify the logo in the top header, edit `hugo.yaml` (or `config/_default/params.yaml`) and add the path of the logo file under `static` directory.

```yaml {file="hugo.yaml"}
params:
  logo: images/logo.svg
```


## Favicon

To modify the [favicon](https://en.wikipedia.org/wiki/Favicon) of the site, place the icon files under the `static` directory.

{{< tree >}}
  {{< branch name="static" >}}
    {{< leaf name="android-chrome-192x192.png" >}}
    {{< leaf name="android-chrome-512x512.png" >}}
    {{< leaf name="apple-touch-icon.png" >}}
    {{< leaf name="favicon-16x16.png" >}}
    {{< leaf name="favicon-32x32.png" >}}
    {{< leaf name="favicon.ico" >}}
    {{< leaf name="favicon.svg" >}}
  {{< /branch >}}
{{< /tree >}}

Include at least `favicon.svg` in the `static` folder. This will be used as the default favicon.

To create an adaptive SVG favicon that responds to system theme preferences by using CSS media queries within the SVG itself, follow the approach described in [Building an Adaptive Favicon](https://web.dev/articles/building/an-adaptive-favicon).

While `favicon.ico` is generally for older browsers, modern browsers support SVG favicons which are preferred for their scalability and small file size.
Use tools like [favicon.io](https://favicon.io/) or [favycon](https://github.com/ruisaraiva19/favycon) to generate additional favicon formats if needed.


## Theme Configuration

Use the `defaultChroma` setting to configure the default chroma mode of the theme, allowing visitors to switch between light or dark mode.

```yaml {file="hugo.yaml"}
params:
  defaultChroma: # light | dark | auto
```

Options for `defaultChroma`:

- `light` - always use light mode
- `dark` - always use dark mode
- `auto` - sync with the operating system setting (default)