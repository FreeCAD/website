---
title: Tree shortcode
description: Create a tree component with branches and leaves.
---

## Example

{{< tree name="example" style="border: var(--border);" >}}
  {{< branch name="content" >}}
    {{< leaf name="_index.md" >}}
    {{< branch name="docs" state="closed" >}}
      {{< leaf name="_index.md" style="color: red;">}}
      {{< leaf name="introduction.md" >}}
      {{< leaf name="introduction.fr.md" >}}
    {{< /branch >}}
  {{< /branch >}}
  {{< leaf name="hugo.toml" >}}
{{< /tree >}}

## Usage

```md {file="Markdown"}
{{</* tree name="example" style="border: var(--border);" >}}
  {{< branch name="content" >}}
    {{< leaf name="_index.md" >}}
    {{< branch name="docs" state="closed" >}}
      {{< leaf name="_index.md" style="color: red;" >}}
      {{< leaf name="introduction.md" >}}
      {{< leaf name="introduction.fr.md" >}}
    {{< /branch >}}
  {{< /branch >}}
  {{< leaf name="hugo.toml" >}}
{{< /tree */>}}
```

## Options

### `branch`

| Parameter | Description |
|-----------|---|
| `name`    | The name of the branch. |
| `type`    | The type of the branch. Can be `folder`, `document`, `container`, `group`, `part`, `assembly`, `arrow`, `branch`, `fork`, or `merge`. Default is `folder`. |
| `state`   | The state of the branch: can be `open` or `closed`. Default is `open`. |
