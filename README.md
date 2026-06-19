# GCLS-D – Dissemination-Paket

Dieses Verzeichnis bündelt alles, was man typischerweise für **Sichtbarkeit + Nutzbarkeit** eines validierten Instruments braucht: Fragebogen, Scoring, Templates, Normwerte, Metadaten und Website-Entwurf.

## Rechte & Autor*innenschaft (zentral – bitte lesen)
- **Originalinstrument (GCLS) Autor*innen**: Bethany A. Jones, Walter Pierre Bouman, Emma Haycraft, Jon Arcelus (UK)
- **Originalpaper (Taylor & Francis)**: Open Access unter **CC BY‑NC‑ND 4.0** (laut PDF) → erlaubt Verteilung, aber **keine Derivate**
- **Deutsch (GCLS-D/GCLS-G)**: Akzeptiert im *International Journal of Transgender Health* (accepted 18‑Jun‑2026; DOI folgt)
- **Zentraler Hinweis**: `metadata/RECHTE_UND_AUTOR_INNENSCHAFT_ZENTRAL.md`

## 1) Fragebogen (Download)
- `questionnaire/GCLS-D_Fragebogen.pdf` (druckfertig)
- `questionnaire/GCLS-D_Fragebogen.tex` (LaTeX-Quelle)
- `questionnaire/GCLS-D_Aenderungslog_Items.md` (Änderungen/Glättungen der deutschen Formulierungen)

## 2) Scoring
- Manual: `scoring/GCLS-D_Scoring_Manual.md`
- R: `scoring/gcls_d_scoring.R`
- SPSS: `scoring/gcls_d_scoring.sps`
- Stata: `scoring/gcls_d_scoring.do`
- Excel Template: `scoring/GCLS-D_Scoring_Template.xlsx`  
  (enthält ein eigenes Tab **`Datenherkunft_Changes`** zur Dokumentation der Herkunft/Änderungen)

## 3) Normwerte & Reliabilität (Referenzdaten)
Aus dem Projekt-Datensatz `Gesamt_Datensatz_merged.xlsx` (0–4 Kodierung) berechnet:
- `norms/GCLS-D_Normwerte_und_Reliabilitaet.xlsx`
- `norms/GCLS-D_Normwerte_gesamt.csv`
- `norms/GCLS-D_Reliabilitaet_alpha.csv`
- `norms/GCLS-D_Normwerte_Subgruppen.csv` (falls Subgruppen-Spalten vorhanden)
- `norms/Meta_norms.json` (Rechen- und Kodierungsmetadaten)

## 4) Exporte (für schnelle Implementierung)
- LimeSurvey: `exports/limesurvey/GCLS-D_v1.0_LimeSurvey.csv`
- REDCap Data Dictionary: `exports/redcap/GCLS-D_REDCap_DataDictionary.csv`
- Qualtrics (minimal QSF): `exports/qualtrics/GCLS-D_Qualtrics_QSF_minimal.json`

## 5) Metadaten / Zitierbarkeit (DOI-ready)
- `metadata/CITATION.cff` (für GitHub/Zenodo)
- `metadata/zenodo.json` (Zenodo-Upload Metadaten)
- `metadata/REFERENCE.md` (Zitierempfehlung-Text)
- `metadata/ORIGINAL_GCLS_Autor_innen_und_Lizenz.md` (Originalautor*innen + Lizenz aus dem GCLS-Originalpaper)
- `metadata/RECHTE_UND_AUTOR_INNENSCHAFT_ZENTRAL.md` (kurzer zentraler Rights/Credits-Hinweis)

## 6) Website (lokaler Entwurf)
- `website/index.html`
- `website/assets/style.css`
- `website/downloads/*` (PDF/TeX sind bereits gespiegelt)

## 7) Vorlagen
- E-Mail an Originalautor*innen: `templates/Email_an_Originalautor_innen.md`
- Textbausteine Datenbanken: `templates/Instrumentdatenbanken_Eintragstext.md`

## Wichtiger Hinweis (rechte-/lizenzbezogen)
Für eine echte Open-Access-Dissemination (Website + Zenodo/OSF DOI) sollte vor Veröffentlichung final geklärt werden,
unter welcher **Lizenz** die **Itemtexte** weitergegeben werden dürfen (in Relation zum Originalinstrument).

Zusatz: Das Originalpaper ist Open Access unter **CC BY-NC-ND 4.0** (laut PDF). Diese Lizenz erlaubt Verteilung, aber **keine Derivate**.
Details siehe `metadata/ORIGINAL_GCLS_Autor_innen_und_Lizenz.md`.

