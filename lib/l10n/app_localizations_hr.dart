// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'reMELD-Na';

  @override
  String get calculate => 'Izračunaj reMELD-Na';

  @override
  String get save => 'Spremi';

  @override
  String get saved => 'Spremljeno';

  @override
  String get newEntry => 'Novo';

  @override
  String get quit => 'Izlaz';

  @override
  String get bloodCollectionDate => 'Datum uzimanja krvi';

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
  String get required => 'Obavezno';

  @override
  String get enterPositiveNumber => 'Unesite pozitivan broj';

  @override
  String get sodiumRange => 'Tipičan raspon: 100–160 mmol/L';

  @override
  String get scoreSavedToHistory => 'Rezultat spremljen u povijest.';

  @override
  String sampleLabel(String date) {
    return 'Uzorak: $date';
  }

  @override
  String get scoreHistory => 'Povijest rezultata';

  @override
  String get noScoresSaved =>
      'Nema spremljenih rezultata.\nNajprije izračunajte i spremite rezultat.';

  @override
  String enteredLabel(String date) {
    return 'Uneseno: $date';
  }

  @override
  String get deleteEntry => 'Obrisati unos?';

  @override
  String get deleteConfirm => 'Ovo se ne može poništiti.';

  @override
  String get cancel => 'Odustani';

  @override
  String get delete => 'Obriši';

  @override
  String get aboutTitle => 'O reMELD-Na';

  @override
  String get aboutWhat => 'Što je reMELD-Na?';

  @override
  String get aboutWhatText =>
      'reMELD-Na (Refitted Model for End-Stage Liver Disease with Sodium) sustav je bodovanja koji se koristi za procjenu težine kronične bolesti jetre i predviđanje 90-dnevne smrtnosti u bolesnika koji čekaju transplantaciju jetre.\n\nPoboljšana je verzija klasičnih MELD i MELD-Na bodova, rekalibrirana na suvremenim kohortama bolesnika.';

  @override
  String get formula => 'Formula';

  @override
  String get variables => 'Varijable';

  @override
  String get varCreatinine => 'Pokazatelj funkcije bubrega';

  @override
  String get varBilirubin => 'Pokazatelj funkcije jetre';

  @override
  String get varINR => 'Pokazatelj koagulacijske funkcije jetre';

  @override
  String get varSodium => 'Razina natrija u serumu';

  @override
  String get varLn => 'Prirodni logaritam (baza e)';

  @override
  String get scoreInterpretation => 'Interpretacija rezultata';

  @override
  String get mortality2 => '~2% smrtnost u 3 mjeseca';

  @override
  String get mortality6 => '~6–20% smrtnost u 3 mjeseca';

  @override
  String get mortality20 => '~20–52% smrtnost u 3 mjeseca';

  @override
  String get mortalityCritical => '>52% smrtnost u 3 mjeseca — Kritično';

  @override
  String get reference => 'Referenca';

  @override
  String get referenceText => 'Kim WR et al. Hepatology, 2021.';

  @override
  String get developer => 'Programerica';

  @override
  String get licenseText =>
      'Objavljeno pod MIT licencom — slobodno za korištenje, izmjenu i distribuciju uz navođenje autora.';

  @override
  String get disclaimer =>
      'Ova aplikacija namijenjena je isključivo kao alat za podršku kliničkim odlukama. Ne zamjenjuje klinički sud. Rezultate uvijek tumačite u kontekstu cjelokupne kliničke slike.';

  @override
  String get mort2 => '~2% smrtnost u 3 mj.';

  @override
  String get mort6to20 => '~6–20% smrtnost u 3 mj.';

  @override
  String get mort20to52 => '~20–52% smrtnost u 3 mj.';

  @override
  String get mortCritical => '>52% — Kritično';

  @override
  String get tooltipHistory => 'Prikaži povijest';

  @override
  String get tooltipInfo => 'O reMELD-Na';

  @override
  String get dialysisQuestion =>
      'Jeste li imali dijalizu u posljednjih 7 dana?';

  @override
  String get dialysisSubtitle =>
      'Dva puta ili više — kreatinin će biti automatski postavljen na 2,5 mg/dL (221,1 µmol/L)';

  @override
  String get dialysisTooltip =>
      'Dijaliza je liječenje kojim se čisti krv kada bubrezi to više ne mogu sami. Ako ste imali ovaj tretman 2 ili više puta u proteklom tjednu, označite ovo polje — vaša vrijednost kreatinina bit će automatski postavljena.';

  @override
  String get anticoagulantQuestion =>
      'Uzimate li tablete za razrjeđivanje krvi (na usta, ne injekcijom)?';

  @override
  String get anticoagulantSubtitle =>
      'Varfarin, acenocumarol, rivaroksaban, apiksaban, dabigatran ili edoksaban — INR će biti postavljen na 1,0';

  @override
  String get anticoagulantTooltip =>
      'Određene tablete za razrjeđivanje krvi koje se uzimaju na usta utječu na vrijednost INR-a na način koji je nepouzdan za ovaj izračun. Injekcije poput heparina NE računaju se. Ako uzimate neku od navedenih tableta, označite ovo polje — vaš INR će automatski biti postavljen na 1,0.';

  @override
  String get unitMgDl => 'mg/dL';

  @override
  String get unitUmolL => 'µmol/L';

  @override
  String get capsApplied => 'Primijenjene granice';

  @override
  String creatinineCap(String value) {
    return 'Kreatinin prilagođen na $value mg/dL';
  }

  @override
  String bilirubinCap(String value) {
    return 'Bilirubin prilagođen na $value mg/dL';
  }

  @override
  String inrCap(String value) {
    return 'INR prilagođen na $value';
  }

  @override
  String sodiumCap(String value) {
    return 'Natrij prilagođen na $value mmol/L';
  }

  @override
  String get calculationLimits => 'Granice izračuna';

  @override
  String get calculationLimitsText =>
      'Sljedeće granice automatski se primjenjuju pri izračunu rezultata, prema EuroTransplantu:';

  @override
  String get limitsDialysis =>
      'Ako je dijaliza provedena dva puta ili više u posljednjih 7 dana, kreatinin se postavlja na 2,5 mg/dL (221,1 µmol/L).';

  @override
  String get limitsAnticoagulant =>
      'Ako se uzimaju tablete za razrjeđivanje krvi (varfarin, acenocumarol, rivaroksaban, apiksaban, dabigatran, edoksaban), INR se postavlja na 1,0.';

  @override
  String get eurotransplantSource => 'Izvor: EuroTransplant MELD kalkulator';

  @override
  String get eurotransplantUrl =>
      'https://www.eurotransplant.org/meld-calculator';
}
