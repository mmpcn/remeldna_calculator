// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'reMELD-Na';

  @override
  String get calculate => 'reMELD-Na berechnen';

  @override
  String get save => 'Speichern';

  @override
  String get saved => 'Gespeichert';

  @override
  String get newEntry => 'Neu';

  @override
  String get quit => 'Beenden';

  @override
  String get bloodCollectionDate => 'Blutentnahmedatum';

  @override
  String get creatinine => 'Kreatinin';

  @override
  String get bilirubin => 'Bilirubin';

  @override
  String get inr => 'INR';

  @override
  String get sodium => 'Natrium / Na (mmol/l)';

  @override
  String get creatinineHint => 'z.B. 1,0';

  @override
  String get bilirubinHint => 'z.B. 1,5';

  @override
  String get inrHint => 'z.B. 1,2';

  @override
  String get sodiumHint => 'z.B. 138';

  @override
  String get required => 'Pflichtfeld';

  @override
  String get enterPositiveNumber => 'Bitte positive Zahl eingeben';

  @override
  String get sodiumRange => 'Typischer Bereich: 100–160 mmol/l';

  @override
  String get scoreSavedToHistory => 'Score wurde gespeichert.';

  @override
  String sampleLabel(String date) {
    return 'Probe: $date';
  }

  @override
  String get scoreHistory => 'Score-Verlauf';

  @override
  String get noScoresSaved =>
      'Noch keine Scores gespeichert.\nBitte zuerst einen Score berechnen und speichern.';

  @override
  String enteredLabel(String date) {
    return 'Eingegeben: $date';
  }

  @override
  String get deleteEntry => 'Eintrag löschen?';

  @override
  String get deleteConfirm => 'Dies kann nicht rückgängig gemacht werden.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get aboutTitle => 'Über reMELD-Na';

  @override
  String get aboutWhat => 'Was ist reMELD-Na?';

  @override
  String get aboutWhatText =>
      'reMELD-Na (Refitted Model for End-Stage Liver Disease with Sodium) ist ein Scoring-System zur Beurteilung des Schweregrades einer chronischen Lebererkrankung und zur Vorhersage der 90-Tage-Mortalität bei Patienten auf der Lebertransplantationsliste.\n\nEs ist eine Weiterentwicklung der klassischen MELD- und MELD-Na-Scores, neu kalibriert an aktuellen Patientenkohorten.';

  @override
  String get formula => 'Formel';

  @override
  String get variables => 'Variablen';

  @override
  String get varCreatinine => 'Marker der Nierenfunktion';

  @override
  String get varBilirubin => 'Marker der Leberfunktion';

  @override
  String get varINR => 'Marker der Gerinnungsfunktion';

  @override
  String get varSodium => 'Serum-Natriumspiegel';

  @override
  String get varLn => 'Natürlicher Logarithmus (Basis e)';

  @override
  String get scoreInterpretation => 'Score-Interpretation';

  @override
  String get mortality2 => '~2% 3-Monats-Mortalität';

  @override
  String get mortality6 => '~6–20% 3-Monats-Mortalität';

  @override
  String get mortality20 => '~20–52% 3-Monats-Mortalität';

  @override
  String get mortalityCritical => '>52% 3-Monats-Mortalität — Kritisch';

  @override
  String get reference => 'Referenz';

  @override
  String get referenceText => 'Kim WR et al. Hepatology, 2021.';

  @override
  String get developer => 'Entwicklerin';

  @override
  String get licenseText =>
      'Veröffentlicht unter der MIT-Lizenz — kostenlos nutzbar, änderbar und weitergebbar mit Namensnennung.';

  @override
  String get disclaimer =>
      'Diese App dient ausschließlich als klinisches Entscheidungshilfsmittel. Sie ersetzt nicht das klinische Urteil. Scores immer im Kontext des gesamten klinischen Bildes interpretieren.';

  @override
  String get mort2 => '~2% 3-Monats-Mortalität';

  @override
  String get mort6to20 => '~6–20% 3-Monats-Mortalität';

  @override
  String get mort20to52 => '~20–52% 3-Monats-Mortalität';

  @override
  String get mortCritical => '>52% — Kritisch';

  @override
  String get tooltipHistory => 'Verlauf anzeigen';

  @override
  String get tooltipInfo => 'Über reMELD-Na';

  @override
  String get dialysisQuestion =>
      'Hatten Sie in den letzten 7 Tagen eine Dialyse?';

  @override
  String get dialysisSubtitle =>
      'Zweimal oder mehr — Kreatinin wird automatisch auf 2,5 mg/dl (221,1 µmol/l) gesetzt';

  @override
  String get dialysisTooltip =>
      'Dialyse ist eine Behandlung, bei der Ihr Blut gereinigt wird, wenn Ihre Nieren das nicht mehr können. Wenn Sie diese Behandlung in der letzten Woche 2 Mal oder öfter hatten, setzen Sie hier ein Häkchen — Ihr Kreatininwert wird automatisch gesetzt.';

  @override
  String get anticoagulantQuestion =>
      'Nehmen Sie blutverdünnende Tabletten (zum Schlucken, keine Spritze)?';

  @override
  String get anticoagulantSubtitle =>
      'Warfarin, Acenocoumarol, Rivaroxaban, Apixaban, Dabigatran oder Edoxaban — INR wird auf 1,0 gesetzt';

  @override
  String get anticoagulantTooltip =>
      'Bestimmte blutverdünnende Tabletten beeinflussen den INR-Wert so, dass er für diese Berechnung unzuverlässig wird. Spritzen wie Heparin zählen NICHT. Wenn Sie eines der genannten Medikamente einnehmen, setzen Sie hier ein Häkchen — Ihr INR wird automatisch auf 1,0 gesetzt.';

  @override
  String get unitMgDl => 'mg/dl';

  @override
  String get unitUmolL => 'µmol/l';

  @override
  String get capsApplied => 'Grenzwerte angewendet';

  @override
  String creatinineCap(String value) {
    return 'Kreatinin angepasst auf $value mg/dl';
  }

  @override
  String bilirubinCap(String value) {
    return 'Bilirubin angepasst auf $value mg/dl';
  }

  @override
  String inrCap(String value) {
    return 'INR angepasst auf $value';
  }

  @override
  String sodiumCap(String value) {
    return 'Natrium angepasst auf $value mmol/l';
  }

  @override
  String get calculationLimits => 'Berechnungsgrenzen';

  @override
  String get calculationLimitsText =>
      'Folgende Grenzen werden bei der Berechnung automatisch angewendet, gemäß EuroTransplant:';

  @override
  String get limitsDialysis =>
      'Bei Dialyse zweimal oder mehr in den letzten 7 Tagen wird Kreatinin auf 2,5 mg/dl (221,1 µmol/l) gesetzt.';

  @override
  String get limitsAnticoagulant =>
      'Bei Einnahme blutverdünnender Tabletten (Warfarin, Acenocoumarol, Rivaroxaban, Apixaban, Dabigatran, Edoxaban) wird INR auf 1,0 gesetzt.';

  @override
  String get eurotransplantSource => 'Quelle: EuroTransplant MELD-Rechner';

  @override
  String get eurotransplantUrl =>
      'https://www.eurotransplant.org/meld-calculator';
}
