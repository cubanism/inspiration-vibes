# Inspiration Vibes

A modern marketing site for **Inspiration Vibes** — an event management & DJ collective
based in Amman, Jordan. Dark desert-night aesthetic, Petra-rose accents, Bedouin geometric
motifs, and Arabic display type woven through a Latin layout.

## Run it

It's a fully static, self-contained site — no build step.

```bash
# option 1: just open it
index.html

# option 2: serve it (recommended, avoids any file:// quirks)
cd InspirationVibes
python -m http.server 8000
# → http://localhost:8000
```

## Structure

```
InspirationVibes/
├── index.html          # the whole site (markup + CSS + JS, self-contained)
├── favicon.svg         # seven-pointed star mark
└── assets/
    ├── fonts.css       # @font-face rules for the self-hosted fonts
    ├── fonts/          # Changa, Rakkas, Almarai, Space Grotesk (woff2, latin + arabic)
    ├── img/            # photography (Wikimedia Commons, CC-licensed)
    └── manifest.json   # asset manifest with licences + attribution
```

## Design system

| Token | Value | Use |
|---|---|---|
| `--bg` | `#0B0908` | warm near-black canvas |
| `--surface` | `#16110D` | cards / player |
| `--ink` | `#F5EEE4` | primary text |
| `--muted` | `#AEA396` | secondary text |
| `--sand` | `#E6D7BE` | borders, accents, outline type |
| `--rose` | `#E07A4B` | primary accent (Petra rose) |
| `--red` | `#CE1126` | Jordan flag red (sparing) |
| `--green` | `#3E9B63` | "live" / playing indicators |
| `--gold` | `#D9A441` | equalizer gradient |

Type: **Changa** (display, Arabic + Latin), **Rakkas** (Arabic display),
**Almarai** (Arabic body), **Space Grotesk** (Latin UI/body).

## Sections

Hero · marquee · About (the vibe + 3 pillars) · Services · Events · Sound (interactive
player with play/pause equalizer) · Jordan (photo collage) · Contact (booking form) · Footer.

## Interactions

- Sticky nav with scroll state + active-section highlighting
- Mobile full-screen menu
- Scroll-reveal animations (disabled under `prefers-reduced-motion`)
- Animated equalizer (generated bars, play/pause toggle)
- Rotating vinyl, marquee, hover states
- Booking form with inline success state

> The form is a front-end demo — wire it to your inbox / WhatsApp / a form service
> (Formspree, Basin, etc.) when you're ready to take real bookings.

## Image credits

Photography is sourced from Wikimedia Commons and is freely licensed. Full attribution
is in `assets/manifest.json`.

| File | Subject | Licence | Photographer |
|---|---|---|---|
| `petra.jpg` | The Treasury, Petra | CC BY-SA 4.0 | Davidchocron |
| `petra-night.jpg` | Petra by night (candles) | CC BY 2.0 | krebsmaus07 |
| `wadi-rum.jpg` | Wadi Rum | CC0 | Peter Chisholm |
| `jerash.jpg` | Jerash ruins | CC BY-SA 4.0 | Abdul Baqi |
| `dead-sea.jpg` | Dead Sea | CC BY-SA 4.0 | Faris El-Gwely |
| `concert.jpg` | Outdoor festival crowd | CC BY-SA 4.0 | PattayaPatrol |
| `dj.jpg` | DJ mixer under red light | CC BY-SA 4.0 | PattayaPatrol |
| `wedding.jpg` | Jordanian wedding procession | CC BY 3.0 | Joud Al-Nsour |

Fonts are self-hosted from Google Fonts (Changa, Rakkas, Almarai, Space Grotesk) under
the SIL Open Font License.

## Notes

- Spelling: the brand is rendered as **Inspiration Vibes** (the brief's "Inspiraton" read
  as a typo). Easy to change globally — it appears in the wordmark, title and footer.
- Contact details (`hello@inspirationvibes.jo`, socials) are placeholders.
