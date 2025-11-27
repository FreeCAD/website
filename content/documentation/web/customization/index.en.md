---
title: Customization
description: How to customize the Trigo Theme.
date: 2020-01-01
authors: FreeCAD
weight: 9
tags:
  - Config
  - Theme
  - Guide
---

The Trigo Theme offers some default customization options in the `hugo.yaml` config file to configure the theme.
This page describes the available options and how to customize the theme further.

## Custom CSS

To add custom CSS, we need to create a file `assets/css/custom.css` in our site. Trigo will automatically load this file.

### Font Family

The font family of the content can be customized using:

```css {file="assets/css/custom.css"}
.content {
  font-family: "Times New Roman", Times, serif;
}
```

### Inline Code Element

The color of text mixed with `other text` can customized with:

```css {file="assets/css/custom.css"}
.content code:not(.code-block code) {
  color: #c97c2e;
}
```

### Primary Color

The primary color of the theme can be customized by setting the `--primary-hue`, `--primary-saturation` and `--primary-lightness` variables:

```css {file="assets/css/custom.css"}
:root {
  --primary-hue: 100deg;
  --primary-saturation: 90%;
  --primary-lightness: 50%;
}
```

### Theme Customization Variables

Trigo provides CSS variables to customize the width of pages, navbar, and footer:

```css {file="assets/css/theme_vars.css"}
:root {
  /* Page width - also configurable via hugo.yaml params.page.width */
  --page-width: 80rem; /* default: 80rem (normal), 90rem (wide), 100% (full) */
}
```

### Syntax Highlighting

List of available syntax highlighting themes are available at [Chroma Styles Gallery](https://xyproto.github.io/splash/docs/all.html). The stylesheet can be generated using the command:

```shell
hugo gen chromastyles --style=github
```

To override the default syntax highlighting theme, we can add the generated styles to the custom CSS file.

## Custom Scripts

You may add custom scripts to the end of the head for every page by adding the following file:

```
layouts/_partials/custom/head-end.html
```

## Custom Extra Section in Footer

You can add extra section in the footer by creating a file `layouts/_partials/custom/footer.html` in your site.

```html {file="layouts/_partials/custom/footer.html"}
<!-- Your footer element here -->
```

The added section will be added before the copyright section in the footer.
You can use [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML) and [Hugo template syntax](https://gohugo.io/templates/) to add your own content.

Hugo variables available in the footer section are: `.switchesVisible` and `.displayCopyright`.

## Custom Layouts

The layouts of the theme can be overridden by creating a file with the same name in the `layouts` directory of your site.
For example, to override the `single.html` layout for docs, create a file `layouts/docs/single.html` in your site.

For further information, refer to the [Hugo Templates][hugo-template-docs].

## Further Customization

Didn't find what you were looking for? Feel free to [open a discussion](https://github.com/FreeCAD/website/discussions) or make a contribution to the theme!

[hugo-template-docs]: https://gohugo.io/templates/
