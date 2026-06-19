# GCLS-D – Scoring Manual (Deutsch)

Stand: 2026-06-19  
Paket: `GCLS-D_Dissemination/`

## Inhalt (kurz)
- **Antwortformat**: 5‑Punkt‑Likert (Niemals, Selten, Manchmal, Oft, Immer)
- **Items**: 38
- **Subskalen**: 7 (laut `GCLS_Itemstruktur.json`)
- **Umpolung**: bestimmte Items werden invertiert (laut `GCLS_Tabelle_mit_offizieller_Umpolung.csv`)
- **Empfohlene Scorebildung**: Subskalen als **Mittelwert** der (umgepolten) Items, sofern genügend valide Items vorhanden sind

## 1) Antwortformat und Kodierung
Im Fragebogen ist das Antwortformat:

1. Niemals  
2. Selten  
3. Manchmal  
4. Oft  
5. Immer  

### Falls Daten bereits als 0–4 kodiert vorliegen
Manche Datensätze liegen (z. B. nach Export/Recoding) als **0–4** vor. Dann gilt:

- 0 = Niemals  
- 1 = Selten  
- 2 = Manchmal  
- 3 = Oft  
- 4 = Immer  

Die Scoring‑Syntax in diesem Paket unterstützt beide Varianten (siehe Hinweise im jeweiligen Skript).

## 2) Offizielle Umpolung (Reverse Scoring)
Quelle: `GCLS_Tabelle_mit_offizieller_Umpolung.csv`

### Reverse‑Items (Itemnummern)
**3, 5, 10, 31, 32, 33, 34, 35, 36, 37, 38**

### Umpolungsformeln
- **Bei 1–5 Skala**: \(x_{\text{rev}} = 6 - x\)
- **Bei 0–4 Skala**: \(x_{\text{rev}} = 4 - x\)

## 3) Subskalenstruktur (7 Subskalen)
Quelle: `GCLS_Itemstruktur.json`

- **Psychological Functioning**: 1, 2, 4, 6, 7, 8, 9, 11, 12, 13  
- **Genitalia**: 14, 21, 25, 26, 27, 29  
- **Social Gender Role Recognition**: 16, 19, 20, 22  
- **Physical and Emotional Intimacy**: 3, 5, 32, 33  
- **Chest**: 15, 18, 28, 30  
- **Other Secondary Sex Characteristics**: 17, 23, 24  
- **Life Satisfaction**: 10, 31, 34, 35, 36, 37, 38  

## 4) Scorebildung (Empfehlung)
### Subskalen
- **Standard**: Mittelwert der Items einer Subskala **nach Umpolung**
- **Missing‑Regel (pragmatisch, transparent)**:
  - Subskala wird berechnet, wenn mindestens **50%** der Items der Subskala valide sind
  - sonst Subskala = fehlend

Diese Regel ist im R‑Skript als Default implementiert und kann angepasst werden.

### Optional: Cluster‑Scores
Wenn du zusätzlich grobe Cluster berichten willst (siehe `GCLS_Itemstruktur.json`):
- **Gender Congruence**: 14–30  
- **Mental Wellbeing and Life Satisfaction**: 1–13 und 31–38  

## 5) Berichtsempfehlung / Interpretation (bodenständig)
- Berichte immer **Skala (1–5 oder 0–4)**, **Umpolung**, **Missing‑Regel**, und ob du **Mittelwert** oder **Summe** verwendest.
- Für praktische Interpretationen sind **Normwerte/Referenzwerte** hilfreich: siehe `norms/`.

## 6) Referenzdateien im Paket
- Fragebogen (PDF): `questionnaire/GCLS-D_Fragebogen.pdf`
- LaTeX‑Quelle: `questionnaire/GCLS-D_Fragebogen.tex`
- Umpolungstabelle: `../GCLS_Tabelle_mit_offizieller_Umpolung.csv` (im Projektroot) bzw. Kopie nach Bedarf
- Subskalenstruktur: `../GCLS_Itemstruktur.json` (im Projektroot)

