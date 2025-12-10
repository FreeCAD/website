---
title: "Syntax Highlighting"
description: How to use syntax highlight in the Trigo Theme.
date: 2020-01-01
authors: FreeCAD
weight: 8
tags:
  - Markdown
  - Code
  - Example
  - Guide
---


> [!NOTE]
> The content below is a placeholder and will be changed soon.


Hugo uses [Chroma](https://github.com/alecthomas/chroma), a general purpose syntax highlighter in pure Go, for syntax highlighting.
It is recommended to use backticks for code blocks in Markdown content. For example:

````markdown {file="Markdown"}
```python
def say_hello():
    print("Hello!")
```
````

will be rendered as:

```python
def say_hello():
    print("Hello!")
```


## Features

### Filename

To add a filename, an url or title to the code block, set attribute `file`:

````markdown {file="Markdown"}
```python {file="hello.py"}
def say_hello():
    print("Hello!")
```
````

```python {file="hello.py"}
def say_hello():
    print("Hello!")
```

### Line Numbers

To set line numbers, set attribute `linenos` to `table` and optionally set `linenostart` to the starting line number:

````markdown {file="Markdown"}
```python {linenos=table,linenostart=42}
def say_hello():
    print("Hello!")
```
````

```python {linenos=table,linenostart=42}
def say_hello():
    print("Hello!")
```

### Highlighting Lines

To highlight lines, set attribute `hl_lines` to a list of line numbers:

````markdown {file="Markdown"}
```python {linenos=table,hl_lines=[2,4],linenostart=1,file="hello.py"}
def say_hello():
    print("Hello!")

def main():
    say_hello()
```
````

```python {linenos=table,hl_lines=[2,4],linenostart=1,file="hello.py"}
def say_hello():
    print("Hello!")

def main():
    say_hello()
```


## Supported Languages

For a list of supported languages, please see the [Chroma documentation](https://github.com/alecthomas/chroma#supported-languages).
