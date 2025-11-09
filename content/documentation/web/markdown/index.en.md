---
title: Markdown Syntax Guide
description: Sample article showcasing basic Markdown syntax and formatting.
date: 2020-01-01
author: "FreeCAD"
weight: 4
tags:
  - Markdown
  - Syntax
  - Example
  - Guide
cover:
  image: 7.webp
  caption: "a cover caption"
  alt: "a cover alternative title"
---

Hugo supports [Markdown](https://en.wikipedia.org/wiki/Markdown) syntax for formatting text, creating lists, and more.

This article offers a sample of basic Markdown syntax that can be used in Hugo content files and its rendered output with the current Theme.

## Headings

```text {file=Markdown}
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

### Heading with custom style {style="color: red"}

### Heading with a custom id {#custom-id}
```

<ins>How it renders:</ins>

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

### Headings with custom style {style="color: red"}

### Heading with a custom id {#custom-id}

## Emphasis

```text {file=Markdown}
*This text will be italic*
_This will also be italic_

**This text will be bold**
__This will also be bold__

_You **can** combine them_
```

<ins>How it renders:</ins>

*This text will be italic*

_This will also be italic_

**This text will be bold**

__This will also be bold__

_You **can** combine them_

## Lists

### Unordered

```text {file=Markdown}
- Item 1
- Item 2
  - Item 2a
  - Item 2b
```

<ins>How it renders:</ins>

- Item 1
- Item 2
  - Item 2a
  - Item 2b

### Ordered

```text {file=Markdown}
1. Item 1
2. Item 2
3. Item 3
   1. Item 3a
   2. Item 3b
```

<ins>How it renders:</ins>

1. Item 1
2. Item 2
3. Item 3
   1. Item 3a
   2. Item 3b

### Task list

```text {file=Markdown}
- [x] Write documentation
- [ ] Review code
- [ ] Deploy changes
```

<ins>How it renders:</ins>

- [x] Write documentation
- [ ] Review code
- [ ] Deploy changes

### Definition list

```text {file=Markdown}
First Term
: This is the definition of the first term.

Second Term
: This is the definition of the second term.
```

<ins>How it renders:</ins>

First Term
: This is the definition of the first term.

Second Term
: This is the definition of the second term.

## Images

```text {file=Markdown}
![](https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png)
```

<ins>How it renders:</ins>

![](https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png)

With caption:

```text {file=Markdown}
![landscape](https://fastly.picsum.photos/id/1044/800/600.jpg?hmac=aNJNCvHzwwgQQWDUJPUFUAyd5LYhh8cAPIawaBtti3c "Lorem Picsum")
```

<ins>How it renders:</ins>

![Alternative text](https://fastly.picsum.photos/id/1044/800/600.jpg?hmac=aNJNCvHzwwgQQWDUJPUFUAyd5LYhh8cAPIawaBtti3c "Image description")

For more advanced functionality, use Hugo's built-in [Figure shortcode](https://gohugo.io/shortcodes/figure/).

## Links

```text {file=Markdown}
[Hugo](https://gohugo.io)

[News Section](/news)

[Heading ID](#custom-id)
```

<ins>How it renders:</ins>

[Hugo](https://gohugo.io)

[News Section](/news)

[Heading ID](#custom-id)

## Styling Text

| Style         | Syntax                   | Example output                        |
| :------------ | :----------------------- | :------------------------------------ |
| Bold          | `**bold**`               | This is a **bold** text               |
| Italic        | `*italic*`               | This is an *italic* text              |
| Strikethrough | `~~strikethrough~~`      | This is a ~~strikethrough~~ text      |
| Subscript     | `<sub>subscript</sub>`   | This is a <sub>subscript</sub> text   |
| Superscript   | `^superscript^`          | This is a ^superscript^ text          |

## Blockquotes

```text {file=Markdown}
> As Newton said:
>
> If I have seen further it is by standing on the shoulders of Giants.
```

<ins>How it renders:</ins>

> As Newton said:
>
> If I have seen further it is by standing on the shoulders of Giants.

### Blockquote with attribution

```text {file=Markdown}
> Don't communicate by sharing memory, share memory by communicating.
> — <cite>Rob Pike[^1]</cite>

[^1]: The above quote is excerpted from Rob Pike's [talk](https://www.youtube.com/watch?v=PAAkCSZUG1c) during Gopherfest, November 18, 2015.
```

<ins>How it renders:</ins>

> Don't communicate by sharing memory, share memory by communicating.
>
> — <cite>Rob Pike[^1]</cite>

[^1]: The above quote is excerpted from Rob Pike's [talk](https://www.youtube.com/watch?v=PAAkCSZUG1c) during Gopherfest, November 18, 2015.

## Inline Code

```text {file=Markdown}
Inline `code` has `back-ticks around` it.
```

<ins>How it renders:</ins>

Inline `code` has `back-ticks around` it.

## Code Blocks

### Syntax Highlighting

````text {file=Markdown}
```go
func main() {
    fmt.Println("Hello World")
}
```
````

<ins>How it renders:</ins>

```go
func main() {
    fmt.Println("Hello World")
}
```

### Code block with backticks and language specified

````text {file=Markdown}
```html {linenos=true}
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Example HTML5 Document</title>
        <meta name="description" content="Sample article showcasing basic Markdown syntax and formatting for HTML elements.">
    </head>
    <body>
        <p>Test</p>
    </body>
</html>
```
````

<ins>How it renders:</ins>

```html {linenos=true}
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Example HTML5 Document</title>
        <meta name="description" content="Sample article showcasing basic Markdown syntax and formatting for HTML elements.">
    </head>
    <body>
        <p>Test</p>
    </body>
</html>
```

### Code block with Hugo's internal highlight shortcode

```text {file=Markdown}
{{</* highlight html >}}

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Example HTML5 Document</title>
        <meta name="description" content="Sample article showcasing basic Markdown syntax and formatting for HTML elements.">
    </head>
    <body>
        <p>Test</p>
    </body>
</html>

{{< /highlight */>}}
```

<ins>How it renders:</ins>

{{< highlight html >}}

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Example HTML5 Document</title>
        <meta name="description" content="Sample article showcasing basic Markdown syntax and formatting for HTML elements.">
    </head>
    <body>
        <p>Test</p>
    </body>
</html>

{{< /highlight >}}

## Tables

```text {file=Markdown}
| Syntax    | Description |
| --------- | ----------- |
| Header    | Title       |
| Paragraph | Text        |
```

<ins>How it renders:</ins>

| Syntax    | Description |
| --------- | ----------- |
| Header    | Title       |
| Paragraph | Text        |

### Inline Markdown within tables and alignment

```text {file=Markdown}
| Italics   | Bold     | Code   |
| :-------- | :------: | -----: |
| _italics_ | **bold** | `code` |
```

<ins>How it renders:</ins>

| Italics   | Bold     | Code   |
| :-------- | :------: | -----: |
| _italics_ | **bold** | `code` |

## Alerts

Alerts are a Markdown extension based on the blockquote syntax that you can use to emphasize critical information.
[GitHub-style alerts](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts) are supported.
Please make sure you are using [Hugo v0.146.0](https://github.com/gohugoio/hugo/releases/tag/v0.146.0) or later.

```text {file=Markdown}
> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.
```

<ins>How it renders:</ins>

> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.

## Other Elements

```text {file=Markdown}
<abbr title="Graphics Interchange Format">GIF</abbr> is a bitmap image format.
```
<abbr title="Graphics Interchange Format">GIF</abbr> is a bitmap image format.

```text {file=Markdown}
H<sub>2</sub>O
```
H<sub>2</sub>O

```text {file=Markdown}
X^n^ + Y^n^ = Z^n^
```

X^n^ + Y^n^ = Z^n^

```text {file=Markdown}
Press <kbd>CTRL</kbd> + <kbd>ALT</kbd> + <kbd>Delete</kbd> to end the session.
```

Press <kbd>CTRL</kbd> + <kbd>ALT</kbd> + <kbd>Delete</kbd> to end the session.

```text {file=Markdown}
Most ==reptiles and salamanders== are nocturnal and hunt for insects, worms and other small creatures. Note that most ==reptiles== are nocturnal and hunt for insects, worms and other small creatures. Most ==reptiles and salamanders== are nocturnal and hunt for insects, worms and other small creatures. Note that most ==reptiles== are nocturnal and hunt for insects, worms and other small creatures.
```

Most ==reptiles and salamanders== are nocturnal and hunt for insects, worms and other small creatures. Note that most ==reptiles== are nocturnal and hunt for insects, worms and other small creatures. Most ==reptiles and salamanders== are nocturnal and hunt for insects, worms and other small creatures. Note that most ==reptiles== are nocturnal and hunt for insects, worms and other small creatures.

## Configuration

Hugo uses [Goldmark](https://github.com/yuin/goldmark) for Markdown parsing.
Markdown rendering can be configured in `hugo.yaml` under `markup.goldmark`.

See Hugo documentation on [Configure Markup](https://gohugo.io/getting-started/configuration-markup/).

## Learning Resources

- [Markdown Syntax Guide](https://www.markdownguide.org/basic-syntax/)
- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [Markdown Tutorial](https://www.markdowntutorial.com/)
- [Markdown Reference](https://commonmark.org/help/)
- [Hugo Markdown](https://gohugo.io/content-management/formats/#markdown)
