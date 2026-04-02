# reMELD-Na Calculator

An Android app for calculating the **reMELD-Na score** (Refitted Model for End-Stage Liver Disease with Sodium), used to assess severity of chronic liver disease and predict 90-day mortality in patients awaiting liver transplantation.

## Features

- Calculate reMELD-Na score from blood sample values
- Date picker for blood collection date (allows entering historical exams)
- Color-coded result with mortality interpretation
- Local history of previous scores, sorted by collection date
- Delete individual history entries
- Information screen with formula, variable descriptions, and score interpretation
- Single patient use, all data stored locally on device

## Formula

```
reMELD-Na = 7.85
          + 9.03  × ln(Creatinine)
          + 2.97  × ln(Bilirubin)
          + 9.52  × ln(INR)
          + 0.392 × (138.6 − Na)
          − 0.351 × (138.6 − Na) × ln(Creatinine)
```

### Variables
| Variable | Unit | Description |
|----------|------|-------------|
| Creatinine | mg/dL | Marker of kidney function |
| Bilirubin | mg/dL | Marker of liver function |
| INR | — | Marker of clotting ability |
| Na (Sodium) | mEq/L | Serum sodium level |
| ln | — | Natural logarithm (base e) |

### Score Interpretation
| Score | 3-month mortality |
|-------|-------------------|
| < 10 | ~2% |
| 10 – 19 | ~6–20% |
| 20 – 29 | ~20–52% |
| ≥ 30 | >52% — Critical |

## Reference

Kim WR et al. "Mortality and Optimal Listing Criteria for Patients with End-Stage Liver Disease." *Hepatology*, 2021.

## Disclaimer

This app is intended as a clinical decision support tool only. It does not replace clinical judgment. Always interpret scores in the context of the full clinical picture.

## Tech Stack

- [Flutter](https://flutter.dev/) (Dart)
- [sqflite](https://pub.dev/packages/sqflite) — local SQLite storage
- [intl](https://pub.dev/packages/intl) — date formatting
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) — app icon generation

## Getting Started

### Prerequisites
- Flutter SDK ≥ 3.0.0
- Android Studio (for Android SDK and emulator)

### Build and run

```bash
git clone https://github.com/YOUR_USERNAME/meldna_calculator.git
cd meldna_calculator
flutter pub get
dart run flutter_launcher_icons
flutter run
```

## Developer

**Margarida Castro Neves**

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
