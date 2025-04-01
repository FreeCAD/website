**⚠ Temporary development repository : the [official repository](https://github.com/FreeCAD) will be available at a later time ⚠**

[Contributing](#contributing) • [Development](#development) • [Project structure](#project-structure) • [Content guidelines](#content-guidelines) • [Theme and templates](#theme-and-templates) • [Resources](#resources) • [License](#license)
# FreeCAD Website

Welcome to the source code of [FreeCAD website](https://www.freecad.org). In this repository are found all content, assets and theme used.

The site is static and generated thanks to [Hugo](https://gohugo.io/), a static site generator written in Golang.

For other parts of FreeCAD web ecosystem, head to :

- [FreeCAD software source](https://github.com/FreeCAD/FreeCAD)
- [FreeCAD user documentation `Wiki`](https://wiki.freecad.org/)
- [FreeCAD developer documentation `Handbook`](https://freecad.github.io/DevelopersHandbook/) and [its source](https://github.com/FreeCAD/DevelopersHandbook).
- [FreeCAD forum](https://forum.freecad.org/)
- [FreeCAD Project Association](https://fpa.freecad.org/) and [its source](https://github.com/FreeCAD/FPA).

## Contributing

Contributions are always welcome ! FreeCAD website is free and open source just like FreeCAD.

When contributing to the website, please keep in mind that it acts as the public face of the FreeCAD organization and community. Thus, substantial changes must be discussed beforehand via its usual communication channels (e.g. GitHub issues, [Matrix chat](https://matrix.to/#/#FreeCAD_FreeCAD:gitter.im), [Forum](https://forum.freecad.org/), [Discord](https://discord.com/invite/F4hdxzYZfc)). Note that [FreeCAD's code of conduct](https://github.com/FreeCAD/FreeCAD/blob/main/CODE_OF_CONDUCT.md) must be observed at any time.

Below can be found information for all contributors (e.g. content, translations, bug fixes and theme improvements). Depending on the scope of contributions, some basic know-how of Git, YAML and Markdown is recommended to add and edit content. For theme customization, basic know-how of HTML5, CSS3, Javascript and Go template syntax is recommended.

For bug report, please use the provided template when creating an issue in this repository.

### Browser support

When working on new features, keep in mind this website only supports *evergreen browsers* :

- Firefox (latest version, N-1 version, and latest ESR version)
- Chrome (latest version and N-1 version)
- Edge (latest version and N-1 version)
- Opera (latest version and N-1 version)
- Safari (latest version and N-1 version)

**Internet Explorer isn't supported.**

## Development

### Building

To build the website locally, follow these steps :

1. Install [Hugo standard edition](https://gohugo.io/installation/). **⚠ This temporary repo is developed with Hugo ≥ 0.145 for now ⚠**
2. Install [Git](https://git-scm.com/).
3. Optionally, if developing Hugo modules, install [Go](https://go.dev/doc/install).
3. Clone this repository or download the Code Zip and unzip it.
4. Open the terminal at your cloned or downloaded folder location.
5. Build the site locally : within the root directory of the site, run `hugo server`. To build with Draft pages, run `hugo server -D`.

Building should be relatively fast (about 10 seconds) and without errors.

To view the website locally, open your web browser at the indicated address, by default `https://localhost:1313/`.

### Deployment

This project uses a `development` > `testing` > `production` environments logic :

- The `development` environment is your local clone/fork. The result can be seen on your web browser after following the [Building instructions above](#building).
- The `testing` environment is this current repository. The result can be seen on [GitHub Pages](TODO: add link).
- The `production` environment is hosted on FreeCAD's sever. The result can be seen on [FreeCAD website](https://www.freecad.org).

Testing builds deployment to GitHub Pages is done automatically by GitHub Actions whenever the `testing` branch receives a new commit. The `testing` branch itself should not be deployed, as it only contains the source files. The built version of the website is in the `public` folder, generated from the `hugo` command. The official website version is built from the `production` branch instead.

**⚠ No GitHub Actions for production for now. Must be added when this temporary repository is migrated to the official FreeCAD repository ⚠**


## Website structure

### Use and navigation overview

The website is structured following a tree logic (directory), where each branch (folders) contains sub-branches (sub-folders) and/or leafs (files) where content is stored. The Homepage is the trunk giving access to the various main branches (called `sections` in Hugo lingo) of the navigation menu (e.g. `features`,`download`, `news`, etc). Some of these main branches give access to further sub-branches (e.g. news articles categories). To keep the site simple, only three branch levels are used for the moment, making the navigation easier to understand and maintain, limiting the necessity of a search function.

The website is multilingual, with English being the default language. That means that available translated content in any enabled language is accessible using the language dropdown in the header.

**⚠ Currently no detection of the user language is implemented, so the English version is presented first. ⚠**

Instant click is enabled, making the navigation from pages to pages almost instantaneous. A light and dark version of the theme is available on the sun/moon icon on the top header.

**⚠ Note that this is a temporary development version and not all features are available yet (comments, social media linking, etc). ⚠**

### Technical overview

The static site generator used, [Hugo](https://gohugo.io), takes the plain-text content files (typically in Markdown), marries them to an appropriate set of templates, and produces a complete set of HTML5 pages (with CSS3 and Javascript if needed) that can be served by any generic stand-alone web server.

To understand how Hugo works, head to its [Official documentation](https://gohugo.io/documentation/).

### Content files and metadata

There are two main types of content files: single pages (`index.md`) and lists (`_index.md`) which gather content from other content files to form a list. The former are where most changes will be made. The latter should not be changed in most cases. All linked resources for a specific page (e.g. images, translations, download assets) can be stored in the same folder as the page itself.

These files are written in Markdown and contain a metadata header called the Front Matter (at the top of the file in-between the YAML `---` characters) used by the generator. How content from singles pages and lists is generated into HTML is defined by templates used by the Theme ([see below](#theme) how it works).

The following folders contain content files :

- `content/_index.md` is the Homepage file. This is a list file gathering content from other pages, mainly in the News and Homepage sections, via template actions.

- `content/homepage` contains files relevant to the Homepage (general overview and features).

- `content/features` contains files relevant to showcase FreeCAD features.

- `content/download` contains files relevant to download FreeCAD current latest release per platform, links to development, previous versions and other useful resources to install. To change the latest release builds, read the section just below about the `releases` folder.

- `content/releases` contains files relevant to release notes, to highlight particular new developments and features of a release. This section has a list page with all release notes sorted by date. Each release files are organized in sub-folders. The following metadata fields are required for the release notes to be correctly displayed throughout the website: `title` (version of the release), `description`, `date`, `params` and `cover` (splashscreen of the release). To add a new release note, read the section below about [Updating FreeCAD download release](#updating-FreeCAD-download-release).

- `content/news` contains articles for the news blog. This section has a main list page with all articles sorted by date. Articles are organized in `categories` sub-folders. Each category sub-folder has a list page too. The following metadata fields are required for the article to be correctly displayed throughout the website: `title`, `description`, `date`, `author`, `categories`,`tags` and `cover image`. The image used is the one from the `cover` field. The name of the folder acts as a slug in the generated URL. `Draft` articles or articles with a `date` in the future are not published in the production environment. To have an article featured at the top of the Homepage, the Params must be set to `hero`. To create a news article, read the section below about [Archetypes](#archetypes).

- `content/documentation` contains files relevant for users to get started with FreeCAD (wiki, manual, tutorials, learning network).

- `content/community` contains files relevant for users to get involved with the FreeCAD community (events, online groups, association).

- `content/contribute` contains files relevant to start contributing to FreeCAD development (bug reports, translations, code, grants).

- `content/donate` contains files relevant to user donations to the FreeCAD Project Association (sponsors). This section has a list page with all current sponsors sorted by date. The following metadata fields are required for the sponsors to be correctly displayed throughout the website: `title` (name of the sponsor), `link` (link of the sponsor if applicable) `type` (sponsor level e.g. bronze, silver or gold), `date` (start of the sponsorship). To add a new sponsor, read the section below about [Archetypes](#archetypes).

- `content/about` contains files relevant to the website (credits, term of use, archives, etc).

- **⚠ `content/theme-docs` contains files relevant to the website development (temporary folder only) ⚠**

### Root folders skeleton

```
FreeCAD-website/
├── .github/
├── archetypes/
├── assets/
├── content/
├── data/
├── i18n/
├── layouts/
├── public/     <-- generated when building the site, not in git repository
├── resources/  <-- generated when building the site, not in git repository
├── static/
├── themes/
├── .gitignore
├── hugo.yaml
├── LICENSE
└── README.md
```

Following Hugo's [Lookup order](https://gohugo.io/templates/lookup-order/) and [Union file system](https://gohugo.io/getting-started/directory-structure/#union-file-system) logic, some of the following folders are also present in the `theme` folder. When two files have the same path and filename, the file in the root project directory takes precedence. This allows to override a theme’s template by placing a copy in the same location within the root project directory. Currently, most files are placed in the `theme` folder.



- `.github` contains configuration and template files for GitHub.

- `archetypes` contains pre-made template files to easily add new content. Read below about [Archetypes](#archetypes).

- `assets` contains global resources used throughout the website that can be modified using pipes. This includes the CSS, JS, and images. For media content used in articles and other pages check their respective folders.

- `content` contains the content files. Read above about [Content files](#content-files-and-metadata).

- `data` contains local data resources (e.g. JSON, YAML, XML) to augment or create content. Currently empty, it may be used in the future to store e.g. authors data.

- `i18n` contains translation tables for the multilingual website.

- `layouts` contains the wrapping templates to transform content, data and resources into a complete set of HTML pages.

- `public` contains the published website generated by the `hugo` and `hugo server` commands. It must not be version-controlled by git. When creating a Pull Request, please do not include it.

- `resources` contains the cached output from Hugo pipelines generated by the `hugo` and `hugo server` commands, e.g. CSS and images. It must not be version-controlled by git. When creating a Pull Request, please do not include it.

- `static` contains global static resources used throughout the website. This includes favicons and fonts.

- `theme` contains the theme files with its specific templates, layouts, assets and translation tables. It is currently called `FC` Hugo theme. Read below about the [Theme and templates](#theme-and-templates).

### Build system and configuration

This project is built with Hugo, with the build instructions located in the `hugo.yaml` configuration file. When building locally, some configuration options may be different.

## Content guidelines

### Overview

TODO

### Archetypes

TODO

### Updating FreeCAD download release

TODO

All download information about the current stable version, and future new release you may add, is stored in the front matter of release notes pages.

To create a new release, use the following archetype :

```
hugo new -kind release releases/X-Y <-- where X is the major version number and Y the minor one
```

```
title: "FreeCAD X.Y Release"        <-- automatically generated, change if needed
description: "The description"      <-- the description must be written
date: 2024-05-18T21:22:57+12:00     <-- automatically generated, change if needed
author: "FreeCAD"                   <-- automatically generated, change if needed
tags:
  - X.Y                             <-- automatically generated, change if needed
params:
  release: X.Y                      <-- automatically generated, change if needed
  windows: link-to-windows-build    <-- the link must be written
  macos: link-to-macos-build        <-- the link must be written
  linux: link-to-linux-build        <-- the link must be written
cover:
  image: splashscreen-x-y.jpg       <-- automatically generated, change if needed
  caption: "the X.Y splashscreen"   <-- automatically generated, change if needed
  alt: "the X.Y splashscreen"       <-- automatically generated, change if needed
```

Make sure to always fill out the release date, version number and the builds link per platform.

### Translations

TODO

Current supported languages are defined in the general site configuration `hugo.yaml`.

Translations of the content are stored in the same folder as the default language file (English) using a [translation by file name](https://gohugo.io/content-management/multilingual/#translate-your-content) approach.

For a language to be enabled, at least the main navigation pages must be translated (features, download, news, community, documentation, contribute and donate).

Translations of the theme are handled by translations tables in `themes/FC/i18n`.

## Theme and templates

**⚠ Please note that for now the code is messy and YOLO. It will gradually be cleaned up, simplified and refactored so it can _live more than once_... ⚠**

TODO

### Theme Overview

TODO

The `FC` theme is based on a standard Hugo theme structure: it uses a set of `HTML5` wrapping templates to transform content, data and resources (in `layout` folder), some `CSS3` stylesheets and `JavaScript` (in `assets` folder). Translations tables for strings in the theme are in `i18n` folder. Some SVG icons are available in `data` folder.

### Features

TODO

### Style

TODO

The style of the theme is defined in `CSS3` stylesheets in `assets/CSS`. Reusable variables are found in `theme_vars.css` in both `Light` and `Dark` variants. General selectors and properties, and style for the `Main` content area for both List and Single pages are defined in `main.css`. The site Header is defined in `header.css` and the site Footer is defined is `footer.css`. The `404.css`, `archive.css` and `term.css` define the style for the Main area of these respective special pages. The `gallery.css`, `highlight.css` and `lightbox.css` (currently unused) define the style for these particular features. The `media.css` defines the style for different devices and screen sizes via media queries (flex and responsive changes).

### Layouts

TODO

Each layout inherits from `layouts/_default/baseof.html` which contains the main structure of the page, including the head and meta tags.

Base default layouts are using either :

- `list.html` provides the template actions for `List` pages, such as the Homepage `_index.md`, the Releases list, the News list and its categories lists and for the Donate page.

- `single.html` provides the template actions for `Single` pages, such as the Features `index.md`, the Release Notes pages, the News articles, the Community page, the Documentation page and the Contribute page.

- `archives.html` provides the template actions for listing all relevant pages in a section within an `Archives` layout. It is not currently used.

- `terms.html` provides the template actions for listing all relevant terms (tags, categories) in a page within an `Terms` layout. It is not currently used.

To organize the code and avoid duplications, the default layouts may include `partials` depending on the context. A `partial` is just another piece of code that also performs template actions.

### Shortcodes

TODO

### Files processing

TODO

## Resources

TODO

- Please consider [website usage stats](https://caniuse.com/) when relying on modern web technologies (web standards support, file type support, etc).

- Before submitting changes, please test thoroughly, ideally on several devices, using browser built-in web tools/extensions, such as Firefox Inspector that displays Responsive Design Mode (Ctrl+Shift+M).

- Have a look at [PageSpeed Insights](https://pagespeed.web.dev/) and [Recommended Accessibility Evaluation Tools](https://www.w3.org/WAI/test-evaluate/tools/list/) when evaluating the website performance and compliance.

- If developing with the IDE `VSCodium`, the extension `Hugo Language and Syntax Support` is recommended.

NOTE: Space placeholder images are from [Euderion](https://deviantart.com/EUDERION). To replace with FreeCAD specific images.

## License

This repository is licensed under the [GNU Lesser General Public License Version 2.1](https://github.com/marcuspollio/FreeCAD-website/blob/testing/LICENSE "Read the license text").

### Content

Content of the website (folder "/content/") is licensed under [Creative Commons Attribution ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/ "Read about the license").
By default, it is copyrighted by and attributed to "FreeCAD contributors". If they wish so, authors can specify the respective attribution for the content they produce. For Markdown files, the attribution is specified in the "author" field of the front matter.

By submitting Pull Requests to this repository, please make sure you are the author of the content uploaded, or otherwise that you have right to share it here under the CC-BY-SA 4.0 license and make sure the original author is mentioned. Also note that sharing images with people is subject to obtaining appropriate consent.

### FreeCAD branded resources

The trademark of FreeCAD branded resources (e.g. FreeCAD logo) is registered and owned by the [FreeCAD Project Association](https://fpa.freecad.org/handbook "Read the FPA Handbook").

### Theme

The FC theme folder is licensed under the [MIT License](https://github.com/marcuspollio/FreeCAD-website/blob/testing/themes/FC/LICENSE "Read the license text").
