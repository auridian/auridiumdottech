# Auridium Technologies website

Source for [auridium.tech](https://auridium.tech/), built with Hugo 0.121.1. The site uses local semantic layouts, a small CSS stylesheet, and a mobile-navigation script.

## Local development

```powershell
hugo server --disableFastRender
```

A production build must remove stale output:

```powershell
hugo --cleanDestinationDir --panicOnWarning --environment production
```

Cloudflare Pages publishes `public/`. To verify the actual redirects and headers locally:

```powershell
npx wrangler pages dev public --ip 127.0.0.1 --port 8788
```

Hugo's development server does not apply Cloudflare's `_redirects` file. Generated `public/`, `resources/_gen/`, and Wrangler files stay untracked.

## Editing

- Home: `layouts/index.html`; metadata: `content/_index.md`
- How we work, referral partners, About, Contact: their `content/<section>/_index.md` files, rendered by `layouts/_default/list.html`
- Work: `layouts/work/list.html`
- Granite Docket case study: `layouts/work/single.html`
- Conducio: `content/products/conducio.md`, rendered by `layouts/products/single.html`
- Shared call to action: `layouts/partials/cta.html`, included once by the base layout on every page except Privacy
- Navigation, footer, metadata, and booking target: `layouts/partials/` and `hugo.toml`
- Styles: `assets/css/site.css`
- Redirects: `static/_redirects`
- Privacy: `content/privacy.md`, deliberately unchanged by the revamp

The original circular logo is used in the header, footer, icons, and updated social image. The footer's leading-zero year (`02026`) is intentional. Site typography uses Arial and Georgia; no monospace fonts, including labels and code elements.

The social card can be regenerated on Windows with `./scripts/render-social-card.ps1`. It uses the unchanged `static/icon-512.png` artwork and editable text, without external dependencies.

## Current publishing decisions

Published pages contain no unfinished copy placeholders. Do not add invented testimonials, prices, or terms.

- All “Arrange a call” links use `mailto:hello@auridium.tech?subject=30-minute%20call`. Scheduling is handled by email; no automatic booking service is planned.
- Monthly support scope and pricing are agreed individually, based on each client's systems and needs.
- `params.graniteDocketURL` is `https://granitedocket.com/`, as confirmed by the owner.
- Partners is an unpublished draft with no navigation or sitemap link. Referral terms do not block publishing the rest of the site.
- The optional personal-copy placeholder on About has been removed.

The supplied engagement terms and founder biography are owner-provided copy, not independently verified business evidence.

Review fees are agreed privately, with no published amount or price placeholder. Reviews take one day to one week depending on scope. The owner confirmed Granite Docket is used by legislators and political organizations; no frequency or sponsorship claim is made. Client stories are omitted because existing projects are under NDA.

## Routes

Published: `/`, `/how-we-work/`, `/work/`, `/work/granite-docket/`, `/about/`, `/contact/`, `/privacy/`.

`/products/conducio/` remains available by direct URL, with no sales-page links and no sitemap entry. Partners and draft case studies remain unpublished. No blog content existed in the checkout.

`/services` and `/services/` return 301 redirects to `/how-we-work/#main-content`. The explicit destination fragment replaces old service fragments and lands at the new page's main content. `/capabilities/` also redirects directly to How we work.

## Contact and privacy

Contact uses email for project inquiries and arranging calls. The former Tally embed is no longer on the page. Its existing form ID is retained in configuration; the external Tally form/account and Privacy content were not changed. Ordinary email links remain compatible with Cloudflare's existing edge email-protection setting.

## Validation and publishing

See `docs/validation.md` for current checks and historical records. Before publishing, build without drafts, check rendered pages for unfinished placeholders, and verify links. No production deployment is implied by a local build.
