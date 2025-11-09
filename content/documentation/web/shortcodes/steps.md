---
title: Steps shortcode
---

A built-in component to display a series of steps.

You can use the Markdown attribute `{class="no-step"}` to prevent a heading from being counted as a step.

## Example

{{% steps %}}

### Step 1

This is the first step.

### Step 2

This is the second step.

#### Step subheading {class="no-step"}

This will not be counted as a step.

### Step 3

This is the third step.

{{% /steps %}}


## Usage

> [!WARNING]
> Please note that this shortcode is intended **only for Markdown content**.
> If you put HTML content or other shortcodes as step content, it may not render as expected.

```markdown {file="markdown"}
{{% steps %}}

### Step 1

This is the first step.

### Step 2

This is the second step.

#### Step subheading {class="no-step"}

This will not be counted as a step.

{{% /steps %}}
```
