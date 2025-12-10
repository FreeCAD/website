---
title: Structure and organization
description: How to organize files in the Trigo Theme.
date: 2020-01-01
authors: FreeCAD
weight: 2
tags:
  - Theme
  - Structure
  - Guide
---


> [!WARNING]
> Trigo Theme is still in active development.
> The following documentation is not yet accurate or up-to-date.
> Have a question or feedback? Feel free to [open an issue](https://github.com/FreeCAD/website)!


## Directory Structure

By default, Hugo searches for Markdown files in the `content` directory, and the structure of the directory determines the final output structure of your website.
Take this site as an example:

{{< tree >}}
  {{< branch name="content" >}}
    {{< leaf name="_index.md" >}}
    {{< branch name="docs" state="open" >}}
      {{< leaf name="_index.md" >}}
      {{< leaf name="getting-started.md" >}}
      {{< branch name="guide" state="open" >}}
        {{< leaf name="_index.md" >}}
        {{< leaf name="organize-files.md" >}}
      {{< /branch >}}
    {{< /branch >}}
    {{< branch name="blog" state="open" >}}
      {{< leaf name="_index.md" >}}
      {{< leaf name="post.md" >}}
    {{< /branch >}}
  {{< /branch >}}
{{< /tree >}}

Each of the `_index.md` files is the index page for the corresponding section. The other Markdown files are regular pages.

```text
📁content
├── _index.md  ← /
├── 📁docs
│   ├── _index.md  ← /docs/
│   ├── getting-started.md  ← /docs/getting-started/
│   └── 📁guide
│       ├── _index.md  ← /docs/guide/
│       └── organize-files.md  ← /docs/guide/organize-files/
└── 📁blog
    ├── _index.md  ← /blog/
    └── post.md  ← /blog/post/
```


## Configure Content Directory

By default, the root `content/` directory is used by Hugo to build the site.
If you need to use a different directory for content, for example `docs/`, this can be done by setting the [`contentDir`](https://gohugo.io/getting-started/configuration/#contentdir) parameter in the site configuration `hugo.yaml`.


## Add Images

To add images, the easiest way is to put the image files in the same directory as the Markdown file.
For example, add an image file `image.png` alongside the `my-page.md` file:

{{< tree >}}
  {{< branch name="content" >}}
    {{< branch name="docs" >}}
        {{< leaf name="my-page.md" >}}
        {{< leaf name="image.png" >}}
    {{< /branch >}}
  {{< /branch >}}
{{< /tree >}}

Then, we can use the following Markdown syntax to add the image to the content:

```markdown {file="content/docs/my-page.md"}
![alt](image.png "title")
```

We can also utilize the [page bundles][page-bundles] feature of Hugo to organize the image files together with the Markdown file. To achieve that, turn the `my-page.md` file into a directory `my-page` and put the content into a file named `index.md`, and put the image files inside the `my-page` directory. With multi-lingual sites, translated content can be organized in the same directory with the language code in the file name.

{{< tree >}}
  {{< branch name="content" >}}
    {{< branch name="docs" >}}
        {{< branch name="my-page" >}}
            {{< leaf name="index.en.md" >}}
            {{< leaf name="index.fr.md" >}}
            {{< leaf name="image.png" >}}
        {{< /branch >}}
    {{< /branch >}}
  {{< /branch >}}
{{< /tree >}}

```markdown {file="content/docs/my-page/index.en.md"}
![alt](image.png "title")
```

Alternatively, we can also put the image files in the `static` directory, which will make the images available for all pages:

{{< tree >}}
  {{< branch name="static" >}}
    {{< branch name="images" >}}
        {{< leaf name="image.png" >}}
    {{< /branch >}}
  {{< /branch >}}
  {{< branch name="content" >}}
    {{< branch name="docs" >}}
        {{< leaf name="my-page.md" >}}
    {{< /branch >}}
  {{< /branch >}}
{{< /tree >}}

> [!NOTE]
> The path for an image in the static directory begins with a slash `/`.

```markdown {file="content/docs/my-page.md"}
![alt](/images/image.png "title")
```

[page-bundles]: https://gohugo.io/content-management/page-bundles/#leaf-bundles
