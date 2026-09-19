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

## September 19, 2026 redesign (local)

Reworked the site from current `origin/master` at `835d434` with a clean starting tree. The new layouts use a quieter wordmark, large sans/serif typography, real project imagery, open service rows, shorter copy, and shared project previews. The existing routes, email address, Tally form ID, and current/development distinction for Conducio are retained.

Verified locally:

- Clean production Hugo build with `--panicOnWarning`.
- All eight public routes and the 404 page at 320px, 390px, 768px, and 1440px. No horizontal overflow; the 320px homepage heading issue found during review was corrected.
- Internal links, assets, fragment targets, heading order, one H1 per route, image alternative text, and intrinsic image dimensions.
- Mobile navigation, Escape-to-close, close-on-navigation, reset on desktop resize, visible keyboard focus, and the skip-to-content link.
- Real browser review of home, services, about, and contact layouts. Product previews use the repository's existing screenshots.
- Tally's public form and embed URL both render when opened directly. The cross-origin iframe remained blank inside the Codex preview browser; embedded rendering and a new submission were not verified. The direct Tally link now sits above the iframe, with an independent email option alongside it.

No deployment or external form changes were made. Earlier Lighthouse and submission results in this document are historical and were not rerun for this redesign.

## September 19, 2026 — owner-provided revamp brief

This implementation supersedes the earlier September 19 design pass. It retains the visual style, restores the original circular logo and leading-zero footer year, and applies the supplied small-business positioning, copy, and page structure.

- Added How we work and For referral partners. Removed Services content and layout. Rewrote Home, Work, the Granite Docket case study, About, Contact, and Conducio.
- Booking targets are configured once, with the specified call-request email fallback. Missing prices, stories, referral terms, booking URL, public project URL, and optional About text stay visible.
- Sponsorship and daily-use claims remain marked for owner confirmation; they have not been presented as verified facts.
- Conducio remains directly reachable, unlinked from sales pages, and absent from the sitemap. No blog content existed in the checkout.
- Privacy content is byte-for-byte unchanged. Other pages, including the 404 page, have the common CTA. “Billing by the hour” resolves the brief's conflict with its banned-word list.
- The social image is 1200×630, contains the existing logo artwork, and replaces the previous tagline. Header/footer/icon logo assets were not modified.

Validation completed:

- Hugo 0.121.1 clean production build with warnings treated as failures; Git whitespace check.
- Exact inventory of nine content routes plus the 404 page; internal links, local assets, fragment targets, image dimensions/alt text, heading order, and one H1 per page.
- Matching meta/Open Graph/Twitter descriptions, valid JSON-LD, specified navigation order, original logo references, `02026` footer, booking fallback, common CTA coverage, and visible owner placeholders.
- No banned copy in published HTML, JavaScript, XML, JSON, text, or manifest files.
- Browser layout checks on all ten pages at 320, 390, 768, and 1440 pixels: 40 checks, no horizontal overflow.
- Local Cloudflare Pages runtime parsed all 13 redirects. `/services` and `/services/` return 301. All five legacy service fragments land on `/how-we-work/#main-content`; the explicit destination fragment replaces obsolete anchors. `/capabilities/` goes directly to `/how-we-work/`.

Cloudflare's fragment behavior is documented at https://developers.cloudflare.com/pages/configuration/redirects/ and was verified in the local Pages browser journey. The source Privacy file and Cloudflare account settings were left unchanged. No production release, live form submission, or new Lighthouse run was performed.

Final interaction checks: mobile navigation opens, closes after choosing Contact, closes with Escape, and restores focus to its toggle. The Contact page's four booking links all resolve to the same configured fallback. Preview images are `screenshots/revamp-home-desktop.png` and `screenshots/revamp-home-mobile.png`. The social card is generated from the unchanged original logo using `scripts/render-social-card.ps1` so its text stays sharp and editable.

## September 19, 2026 — owner corrections

- Corrected Granite Docket's data description: legislation is machine-readable; many other records are parsed PDFs. Published the owner-approved statement that it is used by legislators and political organizations, without claiming daily use or sponsorship.
- Replaced all three Granite Docket images with current, unaltered browser captures of the live homepage, bill register, and September 23 calendar agenda. Conducio's old screenshot remains removed.
- Removed the review-price placeholder and all client-story placeholders. Review fees are agreed privately; reviews take one day to one week. Client work stays private because it is under NDA.
- Replaced the wording about written “done” and defensive pricing with clear scope, deliverables, acceptance checks, and costs.
- Removed monospace typography, including labels, step numbers, and code-element defaults. Original logo assets and Privacy content remain byte-for-byte unchanged.

Focused proof: clean production Hugo build with warnings treated as failures; Git whitespace check; all ten generated pages checked for local links, fragments, image dimensions, alt text, and removed copy. Browser checks at 320, 390, 768, and 1440 pixels passed on all ten pages (40 checks), with no horizontal overflow and no monospace computed font family on elements or their pseudo-elements. These checks concern Auridium's typography; screenshots faithfully reproduce the separate product's interface.

Changes remain local and uncommitted. No production deployment was performed.

## September 19, 2026 — publishing copy cleanup

Set the owner-confirmed Granite Docket URL. Call requests always use email, with “Arrange a call” labels and contact copy explaining the process. Monthly support scope and pricing are agreed individually. Process numbers display 1, 2, 3, 4. Removed the optional About placeholder. Partners is an unpublished draft, removed from navigation and the sitemap, so undecided referral terms do not block publication.

Validation: clean production build and whitespace check passed. All nine rendered HTML pages have no bracketed copy placeholders; all 29 call actions point to the intended email request; both Granite Docket visit links use the confirmed URL. Local links and assets resolve. The browser displays the custom 404 for `/partners/`, and the homepage accessibility tree confirms plain step numbers. Contact has no horizontal overflow at 390, 801, and 1440 pixels, with email targets verified at each size. No email was sent. Changes remain local, uncommitted, and unpublished.

## September 19, 2026 — release preparation

The owner authorized commit, push, and deployment. Before committing, refreshed `origin/master` and confirmed the checkout matched `835d43499250a227de95c4db029858fb1eadfcf8`. Cloudflare Pages project `auridiumdottech` serves `auridium.tech` from the repository's `master` branch; its latest production deployment was the same baseline, with no release running. The clean production build and whitespace check passed again. Original logo assets and Privacy content remain unchanged. Publishing uses the existing Git integration; production success and live behavior must be verified after the push.
