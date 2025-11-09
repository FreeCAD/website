---
title: Deploy Site
description: How to deploy a site using Hugo.
date: 2020-01-01
weight: 11
---

Hugo generates static websites, allowing for flexible hosting options.
This page provides guides for deploying a site using Trigo on various platforms.

## GitHub Pages

[GitHub Pages](https://docs.github.com/pages) is the recommended way to deploy and host your website for free.

> [!WARNING]
> In your repository settings, set the **Pages** > **Build and deployment** > **Source** to **GitHub Actions**:

![](gh-pages.png)

By default, the above GitHub Actions workflow `.github/workflows/pages.yaml` assumes that the site is deploying to `https://<USERNAME>.github.io/<REPO>/`.

If you are deploying to `https://<USERNAME>.github.io/` then modify the `--baseURL`:

```yaml {file=".github/workflows/pages.yaml",linenos=table,linenostart=54,hl_lines=[4]}
run: |
  hugo \
    --gc --minify \
    --baseURL "https://${{ github.repository_owner }}.github.io/"
```

If you are deploying to your own domain, please change the `--baseURL` value accordingly.


## Cloudflare Pages

1. Put your site source code in a Git repository (e.g. GitHub)
2. Log in to the [Cloudflare dashboard](https://dash.cloudflare.com/) and select your account
3. In Account Home, select **Workers & Pages** > **Create application** > **Pages** > **Connect to Git**
4. Select the repository, and in the **Set up builds and deployments** section, provide the following information:

| Configuration     | Value                |
| ----------------- | -------------------- |
| Production branch | `main`               |
| Build command     | `hugo --gc --minify` |
| Build directory   | `public`             |

For more details, check out:
- [Deploy a Hugo site](https://developers.cloudflare.com/pages/framework-guides/deploy-a-hugo-site/#deploy-with-cloudflare-pages).
- [Language support and tools](https://developers.cloudflare.com/pages/platform/language-support-and-tools/).
