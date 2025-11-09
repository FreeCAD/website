---
title: Tabs shortcode
---

## Example

{{< tabs >}}
  {{< tab JSON >}}
  **JSON**: JavaScript Object Notation (JSON) is a standard text-based format for representing structured data based on JavaScript object syntax.
  ```json
  { "hello": "world" }
  ```
  {{< /tab >}}
  {{< tab YAML >}}
  **YAML**: YAML is a human-readable data serialization language.
  ```yaml
  hello: world
  ```
  {{< /tab >}}
  {{< tab TOML >}}
  **TOML**: TOML aims to be a minimal configuration file format that's easy to read due to obvious semantics.
  ```toml
  hello = "world"
  ```
  {{< /tab >}}
{{< /tabs >}}

## Usage

### Default

```
{{</* tabs */>}}

  {{</* tab JSON */>}}
  **JSON**: JavaScript Object Notation (JSON) is a standard text-based format for representing structured data based on JavaScript object syntax.
  ```json
  { "hello": "world" }
  ```
  {{</* /tab */>}}
  {{</* tab YAML */>}}
  **YAML**: YAML is a human-readable data serialization language.
  ```yaml
  hello: world
  ```
  {{</* /tab */>}}
  {{</* tab TOML */>}}
  **TOML**: TOML aims to be a minimal configuration file format that's easy to read due to obvious semantics.
  ```toml
  hello = "world"
  ```
  {{</* /tab */>}}

{{</* /tabs */>}}
```