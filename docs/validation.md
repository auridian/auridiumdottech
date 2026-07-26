# Validation record

Validated locally on July 25, 2026 with Hugo 0.121.1 and Lighthouse 13 using the mobile preset.

## Build and route inventory

`hugo --cleanDestinationDir --panicOnWarning --environment production` completed without warnings.

Published HTML routes:

- `/`
- `/services/`
- `/work/`
- `/work/granite-docket/`
- `/products/conducio/`
- `/about/`
- `/contact/`
- `/privacy/`

The two future case studies remain `draft: true` and do not appear in the production route inventory or sitemap. Generated `public/` and `resources/_gen/` files are not tracked.

## Lighthouse

| Mobile page | Performance | Accessibility | Best Practices | SEO | LCP | TBT | CLS |
|---|---:|---:|---:|---:|---:|---:|---:|
| Home | 98 | 100 | 100 | 100 | 2.3 s | 30 ms | 0 |
| Contact | 100 | 100 | 100 | 100 | 1.5 s | 60 ms | 0 |

The previous production baseline was 75 Performance, 79 Accessibility, 96 Best Practices, 92 SEO, and a 5.3-second LCP.

## Rendered journeys

Checked at 1440×900 and 390×844:

- Home → Services → Contact
- Home → Granite Docket
- Home → Conducio, including the Current and Long-term direction split
- Mobile navigation open and Escape-to-close behavior
- One H1 per page, ordered section headings, semantic landmarks, visible labels, figure captions, and the skip link
- Reduced-motion CSS and visible keyboard focus styles

The live Tally embed was checked for its five required fields, optional fields, field-length and email-validation configuration, inline errors, an error summary, reCAPTCHA, and success-page configuration. A synthetic inquiry first failed on an invalid email while retaining every entered value, then succeeded after correction and reCAPTCHA. Tally recorded one completed submission, and Proton received the notification in the Auridium mailbox.

## Visual evidence

- `screenshots/before-home-desktop.png`
- `screenshots/before-home-mobile.png`
- `screenshots/after-home-desktop.png`
- `screenshots/after-home-mobile.png`
- `screenshots/form-validation-mobile.png`

## Redirects

Cloudflare Wrangler parsed all 11 rules in `static/_redirects`. Each rule returned an exact 301 in the local Pages runtime:

| Source | Destination |
|---|---|
| `/capabilities/` | `/services/` |
| `/projects/` | `/work/` |
| `/work-with-us/` | `/contact/` |
| `/how-it-works/` | `/products/conducio/` |
| `/roadmap/` | `/products/conducio/` |
| `/join-alpha/` | `/products/conducio/` |
| `/who-its-for/` | `/products/conducio/` |
| `/blog/example/` | `/work/` |
| `/portfolio/example/` | `/work/` |
| `/categories/example/` | `/work/` |
| `/tags/example/` | `/work/` |

The final production check remains part of the post-approval release step.
