# Auridium Technologies website

This is the source for [auridium.tech](https://auridium.tech/). It is a Hugo `0.121.1` static site with local semantic layouts and a small purpose-built CSS system.

## Local development

```powershell
hugo server --disableFastRender
```

Production builds must clean the destination so removed pages cannot survive:

```powershell
hugo --cleanDestinationDir --panicOnWarning
```

Cloudflare Pages should use that command and publish `public/`. Generated `public/` and `resources/_gen/` output is intentionally ignored and must not be committed.

## Editing

- Homepage: `layouts/index.html`
- Services: `layouts/services/list.html`
- Work index: `layouts/work/list.html`
- Granite Docket case study: `layouts/work/single.html`
- Conducio: `layouts/products/single.html`
- About copy: `content/about/_index.md`
- Contact shell: `layouts/contact/list.html`
- Privacy: `content/privacy.md`
- Global navigation and site settings: `hugo.toml`
- Global design system: `assets/css/site.css`
- Redirects: `static/_redirects`

Future case studies belong in `content/work/`. Keep them `draft: true` until the facts, imagery, and publishing permission are ready. Drafts do not enter navigation, the sitemap, or production output.

## Contact form

The Contact page embeds the Auridium-owned Tally form `7RgBB2`. Its public link is `https://tally.so/r/7RgBB2`.

The form uses:

- required name, email, organization, goal, and bottleneck fields;
- optional systems, successful outcome, timing, and budget fields;
- Tally's server-side validation and field-length limits;
- Google reCAPTCHA directly before submission;
- an accessible Tally error summary and inline errors;
- free-tier Tally self-notifications to the account address `forms@auridium.tech`.

The free tier retains Tally branding and stores submissions until they are manually deleted. A visible `hello@auridium.tech` mail link is the independent fallback. There is no custom contact server, Cloudflare Tunnel ingress, SMTP token, analytics, or form-content logging in this repository.

To change the form, edit it in the Auridium Tally workspace. If the form ID changes, update `params.tallyFormId` in `hugo.toml`.

## Routes

Published routes:

- `/`
- `/services/`
- `/work/`
- `/work/granite-docket/`
- `/products/conducio/`
- `/about/`
- `/contact/`
- `/privacy/`

Legacy route mappings live in `static/_redirects`. Cloudflare Pages applies them as permanent redirects.

## Release checklist

1. Run the warning-failing clean Hugo build.
2. Confirm the exact published route inventory and verify drafts are absent.
3. Test the primary journeys at 1440×900 and 390×844.
4. Test keyboard navigation, visible focus, heading order, captions, and reduced motion.
5. Test a Tally validation failure, correction, reCAPTCHA, success page, submission record, and notification delivery.
6. Run mobile Lighthouse and keep Performance, Accessibility, Best Practices, and SEO at 90 or above, or document a specific third-party limitation.
7. Verify every `_redirects` rule in a Cloudflare preview before production.
8. After approval, deploy the exact merged SHA and smoke-test the same journeys on `auridium.tech`.

Rollback is independent of Tally: restore the previous Cloudflare Pages deployment. The form can be closed from Tally without changing the site.
