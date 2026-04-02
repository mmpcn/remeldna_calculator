// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'reMELD-Na';

  @override
  String get calculate => 'Izračunaj reMELD-Na';

  @override
  String get save => 'Shrani';

  @override
  String get saved => 'Shranjeno';

  @override
  String get newEntry => 'Novo';

  @override
  String get quit => 'Izhod';

  @override
  String get bloodCollectionDate => 'Datum odvzema krvi';

  @override
  String get creatinine => 'Kreatinin';

  @override
  String get bilirubin => 'Bilirubin';

  @override
  String get inr => 'INR';

  @override
  String get sodium => 'Natrij / Na (mmol/L)';

  @override
  String get creatinineHint => 'npr. 1,0';

  @override
  String get bilirubinHint => 'npr. 1,5';

  @override
  String get inrHint => 'npr. 1,2';

  @override
  String get sodiumHint => 'npr. 138';

  @override
  String get required => 'Obvezno';

  @override
  String get enterPositiveNumber => 'Vnesite pozitivno število';

  @override
  String get sodiumRange => 'Tipično območje: 100–160 mmol/L';

  @override
  String get scoreSavedToHistory => 'Rezultat shranjen v zgodovino.';

  @override
  String sampleLabel(String date) {
    return 'Vzorec: $date';
  }

  @override
  String get scoreHistory => 'Zgodovina rezultatov';

  @override
  String get noScoresSaved =>
      'Ni shranjenih rezultatov.\nNajprej izračunajte in shranite rezultat.';

  @override
  String enteredLabel(String date) {
    return 'Vneseno: $date';
  }

  @override
  String get deleteEntry => 'Izbrisati vnos?';

  @override
  String get deleteConfirm => 'Tega dejanja ni mogoče razveljaviti.';

  @override
  String get cancel => 'Prekliči';

  @override
  String get delete => 'Izbriši';

  @override
  String get aboutTitle => 'O reMELD-Na';

  @override
  String get aboutWhat => 'Kaj je reMELD-Na?';

  @override
  String get aboutWhatText =>
      'reMELD-Na (Refitted Model for End-Stage Liver Disease with Sodium) je sistem točkovanja za oceno resnosti kronične bolezni jeter in napovedovanje 90-dnevne umrljivosti pri bolnikih, ki čakajo na presaditev jeter.\n\nGre za izboljšano različico klasičnih MELD in MELD-Na točkovanj, umerjeno na sodobnih kohortah bolnikov.';

  @override
  String get formula => 'Formula';

  @override
  String get variables => 'Spremenljivke';

  @override
  String get varCreatinine => 'Kazalnik delovanja ledvic';

  @override
  String get varBilirubin => 'Kazalnik delovanja jeter';

  @override
  String get varINR => 'Kazalnik strjevanja krvi jeter';

  @override
  String get varSodium => 'Raven natrija v serumu';

  @override
  String get varLn => 'Naravni logaritem (osnova e)';

  @override
  String get scoreInterpretation => 'Razlaga rezultata';

  @override
  String get mortality2 => '~2% umrljivost v 3 mesecih';

  @override
  String get mortality6 => '~6–20% umrljivost v 3 mesecih';

  @override
  String get mortality20 => '~20–52% umrljivost v 3 mesecih';

  @override
  String get mortalityCritical => '>52% umrljivost v 3 mesecih — Kritično';

  @override
  String get reference => 'Vir';

  @override
  String get referenceText => 'Kim WR et al. Hepatology, 2021.';

  @override
  String get developer => 'Razvijalka';

  @override
  String get licenseText =>
      'Objavljeno pod licenco MIT — prosto za uporabo, spreminjanje in distribucijo z navedbo avtorja.';

  @override
  String get disclaimer =>
      'Ta aplikacija je namenjena izključno kot orodje za podporo kliničnim odločitvam. Ne nadomešča klinične presoje. Rezultate vedno razlagajte v kontekstu celotne klinične slike.';

  @override
  String get mort2 => '~2% umrljivost v 3 mes.';

  @override
  String get mort6to20 => '~6–20% umrljivost v 3 mes.';

  @override
  String get mort20to52 => '~20–52% umrljivost v 3 mes.';

  @override
  String get mortCritical => '>52% — Kritično';

  @override
  String get tooltipHistory => 'Prikaži zgodovino';

  @override
  String get tooltipInfo => 'O reMELD-Na';

  @override
  String get dialysisQuestion => 'Ste imeli dializo v zadnjih 7 dneh?';

  @override
  String get dialysisSubtitle =>
      'Dvakrat ali večkrat — kreatinin bo samodejno nastavljen na 2,5 mg/dL (221,1 µmol/L)';

  @override
  String get dialysisTooltip =>
      'Dializa je zdravljenje, ki čisti vašo kri, ko tega vaše ledvice ne zmorejo več. Če ste imeli ta postopek 2-krat ali večkrat v preteklem tednu, označite to polje — vrednost kreatinina bo nastavljena samodejno.';

  @override
  String get anticoagulantQuestion =>
      'Jemljete tablete za redčenje krvi (skozi usta, ne z injekcijo)?';

  @override
  String get anticoagulantSubtitle =>
      'Varfarin, acenocumarol, rivaroksaban, apiksaban, dabigatran ali edoksaban — INR bo nastavljen na 1,0';

  @override
  String get anticoagulantTooltip =>
      'Nekatere tablete za redčenje krvi, ki se jemljejo skozi usta, vplivajo na vrednost INR tako, da postane nezanesljiva za ta izračun. Injekcije, kot je heparin, NE štejejo. Če jemljete katero od navedenih tablet, označite to polje — vaš INR bo samodejno nastavljen na 1,0.';

  @override
  String get unitMgDl => 'mg/dL';

  @override
  String get unitUmolL => 'µmol/L';

  @override
  String get capsApplied => 'Mejne vrednosti uporabljene';

  @override
  String creatinineCap(String value) {
    return 'Kreatinin prilagojen na $value mg/dL';
  }

  @override
  String bilirubinCap(String value) {
    return 'Bilirubin prilagojen na $value mg/dL';
  }

  @override
  String inrCap(String value) {
    return 'INR prilagojen na $value';
  }

  @override
  String sodiumCap(String value) {
    return 'Natrij prilagojen na $value mmol/L';
  }

  @override
  String get calculationLimits => 'Mejne vrednosti za izračun';

  @override
  String get calculationLimitsText =>
      'Naslednje mejne vrednosti se samodejno upoštevajo pri izračunu rezultata, kot jih določa EuroTransplant:';

  @override
  String get limitsDialysis =>
      'Če je bila dializa opravljena dvakrat ali večkrat v zadnjih 7 dneh, se kreatinin nastavi na 2,5 mg/dL (221,1 µmol/L).';

  @override
  String get limitsAnticoagulant =>
      'Če se jemljejo tablete za redčenje krvi (varfarin, acenocumarol, rivaroksaban, apiksaban, dabigatran, edoksaban), se INR nastavi na 1,0.';

  @override
  String get eurotransplantSource => 'Vir: EuroTransplant MELD kalkulator';

  @override
  String get eurotransplantUrl =>
      'https://www.eurotransplant.org/meld-calculator';
}
