// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'reMELD-Na';

  @override
  String get calculate => 'Calculate reMELD-Na';

  @override
  String get save => 'Save';

  @override
  String get saved => 'Saved';

  @override
  String get newEntry => 'New';

  @override
  String get quit => 'Quit';

  @override
  String get bloodCollectionDate => 'Blood Collection Date';

  @override
  String get creatinine => 'Creatinine';

  @override
  String get bilirubin => 'Bilirubin';

  @override
  String get inr => 'INR';

  @override
  String get sodium => 'Sodium / Na (mmol/L)';

  @override
  String get creatinineHint => 'e.g. 1.0';

  @override
  String get bilirubinHint => 'e.g. 1.5';

  @override
  String get inrHint => 'e.g. 1.2';

  @override
  String get sodiumHint => 'e.g. 138';

  @override
  String get required => 'Required';

  @override
  String get enterPositiveNumber => 'Enter a positive number';

  @override
  String get sodiumRange => 'Typical range: 100–160 mmol/L';

  @override
  String get scoreSavedToHistory => 'Score saved to history.';

  @override
  String sampleLabel(String date) {
    return 'Sample: $date';
  }

  @override
  String get scoreHistory => 'Score History';

  @override
  String get noScoresSaved =>
      'No scores saved yet.\nCalculate and save a score first.';

  @override
  String enteredLabel(String date) {
    return 'Entered: $date';
  }

  @override
  String get deleteEntry => 'Delete entry?';

  @override
  String get deleteConfirm => 'This cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get aboutTitle => 'About reMELD-Na';

  @override
  String get aboutWhat => 'What is reMELD-Na?';

  @override
  String get aboutWhatText =>
      'reMELD-Na (Refitted Model for End-Stage Liver Disease with Sodium) is a scoring system used to assess the severity of chronic liver disease and predict 90-day mortality in patients awaiting liver transplantation.\n\nIt is a refinement of the classic MELD and MELD-Na scores, recalibrated on contemporary patient cohorts to improve accuracy.';

  @override
  String get formula => 'Formula';

  @override
  String get variables => 'Variables';

  @override
  String get varCreatinine => 'Marker of kidney function';

  @override
  String get varBilirubin => 'Marker of liver function';

  @override
  String get varINR => 'Marker of liver\'s clotting ability';

  @override
  String get varSodium => 'Serum sodium level';

  @override
  String get varLn => 'Natural logarithm (base e)';

  @override
  String get scoreInterpretation => 'Score Interpretation';

  @override
  String get mortality2 => '~2% 3-month mortality';

  @override
  String get mortality6 => '~6–20% 3-month mortality';

  @override
  String get mortality20 => '~20–52% 3-month mortality';

  @override
  String get mortalityCritical => '>52% 3-month mortality — Critical';

  @override
  String get reference => 'Reference';

  @override
  String get referenceText => 'Kim WR et al. Hepatology, 2021.';

  @override
  String get developer => 'Developer';

  @override
  String get licenseText =>
      'Released under the MIT License — free to use, modify and distribute with attribution.';

  @override
  String get disclaimer =>
      'This app is intended as a clinical decision support tool only. It does not replace clinical judgment. Always interpret scores in the context of the full clinical picture.';

  @override
  String get mort2 => '~2% 3-month mortality';

  @override
  String get mort6to20 => '~6–20% 3-month mortality';

  @override
  String get mort20to52 => '~20–52% 3-month mortality';

  @override
  String get mortCritical => '>52% — Critical';

  @override
  String get tooltipHistory => 'View History';

  @override
  String get tooltipInfo => 'About reMELD-Na';

  @override
  String get dialysisQuestion => 'Did you have dialysis in the last 7 days?';

  @override
  String get dialysisSubtitle =>
      'Twice or more — creatinine will be set to 2.5 mg/dL (221.1 µmol/L) automatically';

  @override
  String get dialysisTooltip =>
      'Dialysis is a treatment that cleans your blood when your kidneys cannot do it properly. If you had this treatment 2 or more times in the past week, tick this box — your creatinine value will be set automatically.';

  @override
  String get anticoagulantQuestion =>
      'Are you taking blood-thinning tablets (by mouth, not injection)?';

  @override
  String get anticoagulantSubtitle =>
      'Warfarin, acenocoumarol, rivaroxaban, apixaban, dabigatran or edoxaban — INR will be set to 1.0';

  @override
  String get anticoagulantTooltip =>
      'Some blood-thinning tablets taken by mouth affect the INR measurement in a way that makes it unreliable for this calculation. Injections such as heparin do NOT count. If you are taking any of the tablets listed, tick this box — your INR will be set to 1.0 automatically.';

  @override
  String get unitMgDl => 'mg/dL';

  @override
  String get unitUmolL => 'µmol/L';

  @override
  String get capsApplied => 'Limits applied';

  @override
  String creatinineCap(String value) {
    return 'Creatinine adjusted to $value mg/dL';
  }

  @override
  String bilirubinCap(String value) {
    return 'Bilirubin adjusted to $value mg/dL';
  }

  @override
  String inrCap(String value) {
    return 'INR adjusted to $value';
  }

  @override
  String sodiumCap(String value) {
    return 'Sodium adjusted to $value mmol/L';
  }

  @override
  String get calculationLimits => 'Calculation Limits';

  @override
  String get calculationLimitsText =>
      'The following limits are applied automatically when calculating the score, as defined by EuroTransplant:';

  @override
  String get limitsDialysis =>
      'If dialysis was performed twice or more in the last 7 days, creatinine is set to 2.5 mg/dL (221.1 µmol/L).';

  @override
  String get limitsAnticoagulant =>
      'If blood-thinning tablets are taken (warfarin, acenocoumarol, rivaroxaban, apixaban, dabigatran, edoxaban), INR is set to 1.0.';

  @override
  String get eurotransplantSource => 'Source: EuroTransplant MELD Calculator';

  @override
  String get eurotransplantUrl =>
      'https://www.eurotransplant.org/meld-calculator';
}
