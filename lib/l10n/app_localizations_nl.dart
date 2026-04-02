// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'reMELD-Na';

  @override
  String get calculate => 'reMELD-Na berekenen';

  @override
  String get save => 'Opslaan';

  @override
  String get saved => 'Opgeslagen';

  @override
  String get newEntry => 'Nieuw';

  @override
  String get quit => 'Afsluiten';

  @override
  String get bloodCollectionDate => 'Datum bloedafname';

  @override
  String get creatinine => 'Creatinine';

  @override
  String get bilirubin => 'Bilirubine';

  @override
  String get inr => 'INR';

  @override
  String get sodium => 'Natrium / Na (mmol/L)';

  @override
  String get creatinineHint => 'bijv. 1,0';

  @override
  String get bilirubinHint => 'bijv. 1,5';

  @override
  String get inrHint => 'bijv. 1,2';

  @override
  String get sodiumHint => 'bijv. 138';

  @override
  String get required => 'Verplicht';

  @override
  String get enterPositiveNumber => 'Voer een positief getal in';

  @override
  String get sodiumRange => 'Typisch bereik: 100–160 mmol/L';

  @override
  String get scoreSavedToHistory => 'Score opgeslagen in geschiedenis.';

  @override
  String sampleLabel(String date) {
    return 'Monster: $date';
  }

  @override
  String get scoreHistory => 'Scoregeschiedenis';

  @override
  String get noScoresSaved =>
      'Nog geen scores opgeslagen.\nBereken en sla eerst een score op.';

  @override
  String enteredLabel(String date) {
    return 'Ingevoerd: $date';
  }

  @override
  String get deleteEntry => 'Vermelding verwijderen?';

  @override
  String get deleteConfirm => 'Dit kan niet ongedaan worden gemaakt.';

  @override
  String get cancel => 'Annuleren';

  @override
  String get delete => 'Verwijderen';

  @override
  String get aboutTitle => 'Over reMELD-Na';

  @override
  String get aboutWhat => 'Wat is reMELD-Na?';

  @override
  String get aboutWhatText =>
      'reMELD-Na (Refitted Model for End-Stage Liver Disease with Sodium) is een scoresysteem voor het beoordelen van de ernst van chronische leverziekte en het voorspellen van 90-daagse mortaliteit bij patiënten op de wachtlijst voor levertransplantatie.\n\nHet is een verfijning van de klassieke MELD- en MELD-Na-scores, opnieuw gekalibreerd op hedendaagse patiëntcohorten.';

  @override
  String get formula => 'Formule';

  @override
  String get variables => 'Variabelen';

  @override
  String get varCreatinine => 'Marker van nierfunctie';

  @override
  String get varBilirubin => 'Marker van leverfunctie';

  @override
  String get varINR => 'Marker van stollingsvermogens van de lever';

  @override
  String get varSodium => 'Serum natriumspiegel';

  @override
  String get varLn => 'Natuurlijke logaritme (grondtal e)';

  @override
  String get scoreInterpretation => 'Score-interpretatie';

  @override
  String get mortality2 => '~2% 3-maands mortaliteit';

  @override
  String get mortality6 => '~6–20% 3-maands mortaliteit';

  @override
  String get mortality20 => '~20–52% 3-maands mortaliteit';

  @override
  String get mortalityCritical => '>52% 3-maands mortaliteit — Kritiek';

  @override
  String get reference => 'Referentie';

  @override
  String get referenceText => 'Kim WR et al. Hepatology, 2021.';

  @override
  String get developer => 'Ontwikkelaar';

  @override
  String get licenseText =>
      'Uitgebracht onder de MIT-licentie — vrij te gebruiken, aan te passen en te verspreiden met vermelding.';

  @override
  String get disclaimer =>
      'Deze app is uitsluitend bedoeld als hulpmiddel voor klinische besluitvorming. Het vervangt het klinisch oordeel niet. Interpreteer scores altijd in de context van het volledige klinische beeld.';

  @override
  String get mort2 => '~2% 3-maands mortaliteit';

  @override
  String get mort6to20 => '~6–20% 3-maands mortaliteit';

  @override
  String get mort20to52 => '~20–52% 3-maands mortaliteit';

  @override
  String get mortCritical => '>52% — Kritiek';

  @override
  String get tooltipHistory => 'Geschiedenis bekijken';

  @override
  String get tooltipInfo => 'Over reMELD-Na';

  @override
  String get dialysisQuestion => 'Heeft u de afgelopen 7 dagen dialyse gehad?';

  @override
  String get dialysisSubtitle =>
      'Twee keer of meer — creatinine wordt automatisch ingesteld op 2,5 mg/dL (221,1 µmol/L)';

  @override
  String get dialysisTooltip =>
      'Dialyse is een behandeling waarbij uw bloed wordt gereinigd wanneer uw nieren dat niet meer kunnen. Als u deze behandeling de afgelopen week 2 of meer keer heeft gehad, vink dit vakje aan — uw creatininewaarde wordt automatisch ingesteld.';

  @override
  String get anticoagulantQuestion =>
      'Gebruikt u bloedverdunnende tabletten (via de mond, niet als injectie)?';

  @override
  String get anticoagulantSubtitle =>
      'Warfarine, acenocoumarol, rivaroxaban, apixaban, dabigatran of edoxaban — INR wordt ingesteld op 1,0';

  @override
  String get anticoagulantTooltip =>
      'Bepaalde bloedverdunnende tabletten die via de mond worden ingenomen, beïnvloeden de INR-waarde zodanig dat deze onbetrouwbaar wordt voor deze berekening. Injecties zoals heparine tellen NIET mee. Als u een van de genoemde tabletten gebruikt, vink dit vakje aan — uw INR wordt automatisch op 1,0 ingesteld.';

  @override
  String get unitMgDl => 'mg/dL';

  @override
  String get unitUmolL => 'µmol/L';

  @override
  String get capsApplied => 'Grenzen toegepast';

  @override
  String creatinineCap(String value) {
    return 'Creatinine aangepast naar $value mg/dL';
  }

  @override
  String bilirubinCap(String value) {
    return 'Bilirubine aangepast naar $value mg/dL';
  }

  @override
  String inrCap(String value) {
    return 'INR aangepast naar $value';
  }

  @override
  String sodiumCap(String value) {
    return 'Natrium aangepast naar $value mmol/L';
  }

  @override
  String get calculationLimits => 'Berekeningsgrenzen';

  @override
  String get calculationLimitsText =>
      'De volgende grenzen worden automatisch toegepast bij de berekening van de score, zoals bepaald door EuroTransplant:';

  @override
  String get limitsDialysis =>
      'Als dialyse twee of meer keer is uitgevoerd in de afgelopen 7 dagen, wordt creatinine ingesteld op 2,5 mg/dL (221,1 µmol/L).';

  @override
  String get limitsAnticoagulant =>
      'Als bloedverdunnende tabletten worden gebruikt (warfarine, acenocoumarol, rivaroxaban, apixaban, dabigatran, edoxaban), wordt INR ingesteld op 1,0.';

  @override
  String get eurotransplantSource => 'Bron: EuroTransplant MELD-calculator';

  @override
  String get eurotransplantUrl =>
      'https://www.eurotransplant.org/meld-calculator';
}
