# Validation record

Validated locally on July 26, 2026 with Hugo 0.121.1 and Lighthouse 12.8.2 using the mobile preset.

## Public-copy audit

Audited again on July 26, 2026 against every public route, the shared navigation/footer/CTA, the 404 page, and the current public Conducio tour.

| Surface | Audit result |
|---|---|
| `/` | Changed only the direct Conducio summary and five ambiguous service links. |
| `/services/` | Verified without copy changes; each service still states the situation, typical work, and outcome. |
| `/work/` | Changed only the direct Conducio summary and link label. |
| `/work/granite-docket/` | Verified without copy changes against the live product evidence already recorded. |
| `/products/conducio/` | Rewritten around the currently demonstrated project-continuity and human-review loop; current and future claims remain separate. |
| `/about/` | Replaced the vague final action label with the result it opens. |
| `/contact/` | Verified without copy changes; the Tally form, direct-form fallback, email fallback, and privacy link remain explicit. |
| `/privacy/` | Verified without copy changes against current Tally, reCAPTCHA, Proton, and Cloudflare behavior. |
| 404 | Replaced self-referential system language with a direct explanation and specific recovery links. |

The Conducio figure now uses a current real product screenshot at its true intrinsic size, with task-specific alternative text and a caption that explains the demonstrated result.

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
| Home | 100 | 100 | 100 | 100 | 1.5 s | 0 ms | 0 |
| Conducio | 99 | 100 | 100 | 100 | 2.0 s | 0 ms | 0 |
| Contact | 100 | 100 | 100 | 100 | 1.4 s | 0 ms | 0 |

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
