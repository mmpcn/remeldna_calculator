// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'reMELD-Na';

  @override
  String get calculate => 'reMELD-Na kiszámítása';

  @override
  String get save => 'Mentés';

  @override
  String get saved => 'Mentve';

  @override
  String get newEntry => 'Új';

  @override
  String get quit => 'Kilépés';

  @override
  String get bloodCollectionDate => 'Vérvétel dátuma';

  @override
  String get creatinine => 'Kreatinin';

  @override
  String get bilirubin => 'Bilirubin';

  @override
  String get inr => 'INR';

  @override
  String get sodium => 'Nátrium / Na (mmol/L)';

  @override
  String get creatinineHint => 'pl. 1,0';

  @override
  String get bilirubinHint => 'pl. 1,5';

  @override
  String get inrHint => 'pl. 1,2';

  @override
  String get sodiumHint => 'pl. 138';

  @override
  String get required => 'Kötelező';

  @override
  String get enterPositiveNumber => 'Adjon meg egy pozitív számot';

  @override
  String get sodiumRange => 'Tipikus tartomány: 100–160 mmol/L';

  @override
  String get scoreSavedToHistory => 'A pontszám mentve az előzményekbe.';

  @override
  String sampleLabel(String date) {
    return 'Minta: $date';
  }

  @override
  String get scoreHistory => 'Pontszám előzmények';

  @override
  String get noScoresSaved =>
      'Még nincs mentett pontszám.\nElőbb számítson és mentsen el egy pontszámot.';

  @override
  String enteredLabel(String date) {
    return 'Bevitve: $date';
  }

  @override
  String get deleteEntry => 'Bejegyzés törlése?';

  @override
  String get deleteConfirm => 'Ez a művelet nem vonható vissza.';

  @override
  String get cancel => 'Mégse';

  @override
  String get delete => 'Törlés';

  @override
  String get aboutTitle => 'A reMELD-Na-ról';

  @override
  String get aboutWhat => 'Mi a reMELD-Na?';

  @override
  String get aboutWhatText =>
      'A reMELD-Na (Refitted Model for End-Stage Liver Disease with Sodium) egy pontozási rendszer, amelyet a krónikus májbetegség súlyosságának felmérésére és a májtranszplantációra váró betegek 90 napos mortalitásának előrejelzésére használnak.\n\nA klasszikus MELD és MELD-Na pontszámok továbbfejlesztése, amelyet kortárs betegkohortokra kalibráltak.';

  @override
  String get formula => 'Képlet';

  @override
  String get variables => 'Változók';

  @override
  String get varCreatinine => 'A vesefunkció jelzője';

  @override
  String get varBilirubin => 'A májfunkció jelzője';

  @override
  String get varINR => 'A máj alvadási képességének jelzője';

  @override
  String get varSodium => 'Szérum nátriumszint';

  @override
  String get varLn => 'Természetes logaritmus (alap e)';

  @override
  String get scoreInterpretation => 'Pontszám értelmezése';

  @override
  String get mortality2 => '~2% 3 hónapos mortalitás';

  @override
  String get mortality6 => '~6–20% 3 hónapos mortalitás';

  @override
  String get mortality20 => '~20–52% 3 hónapos mortalitás';

  @override
  String get mortalityCritical => '>52% 3 hónapos mortalitás — Kritikus';

  @override
  String get reference => 'Hivatkozás';

  @override
  String get referenceText => 'Kim WR et al. Hepatology, 2021.';

  @override
  String get developer => 'Fejlesztő';

  @override
  String get licenseText =>
      'MIT licenc alatt kiadva — szabadon felhasználható, módosítható és terjeszthető forrásmegjelöléssel.';

  @override
  String get disclaimer =>
      'Ez az alkalmazás kizárólag klinikai döntéstámogató eszközként szolgál. Nem helyettesíti a klinikai ítéletet. A pontszámokat mindig a teljes klinikai kép összefüggésében kell értelmezni.';

  @override
  String get mort2 => '~2% 3 hónapos mortalitás';

  @override
  String get mort6to20 => '~6–20% 3 hónapos mortalitás';

  @override
  String get mort20to52 => '~20–52% 3 hónapos mortalitás';

  @override
  String get mortCritical => '>52% — Kritikus';

  @override
  String get tooltipHistory => 'Előzmények megtekintése';

  @override
  String get tooltipInfo => 'A reMELD-Na-ról';

  @override
  String get dialysisQuestion => 'Volt dializálva az elmúlt 7 napban?';

  @override
  String get dialysisSubtitle =>
      'Kétszer vagy többször — a kreatinin értéke automatikusan 2,5 mg/dL-re (221,1 µmol/L) lesz állítva';

  @override
  String get dialysisTooltip =>
      'A dialízis egy olyan kezelés, amely megtisztítja a vérét, amikor a vesék már nem képesek erre. Ha az elmúlt héten 2 vagy több alkalommal részesült ebben a kezelésben, jelölje be ezt a mezőt — a kreatinin értéke automatikusan lesz beállítva.';

  @override
  String get anticoagulantQuestion =>
      'Szed-e vérhígító tablettát (szájon át, nem injekció formájában)?';

  @override
  String get anticoagulantSubtitle =>
      'Warfarin, acenocumarol, rivaroxaban, apixaban, dabigatran vagy edoxaban — az INR értéke 1,0-ra lesz állítva';

  @override
  String get anticoagulantTooltip =>
      'Bizonyos szájon át szedett vérhígító tabletták olyan módon befolyásolják az INR-értéket, hogy az megbízhatatlanná válik ehhez a számításhoz. Az injekciók, például a heparin NEM számítanak bele. Ha szedi a felsorolt tabletták valamelyikét, jelölje be ezt a mezőt — az INR-je automatikusan 1,0-ra lesz állítva.';

  @override
  String get unitMgDl => 'mg/dL';

  @override
  String get unitUmolL => 'µmol/L';

  @override
  String get capsApplied => 'Határértékek alkalmazva';

  @override
  String creatinineCap(String value) {
    return 'Kreatinin módosítva: $value mg/dL';
  }

  @override
  String bilirubinCap(String value) {
    return 'Bilirubin módosítva: $value mg/dL';
  }

  @override
  String inrCap(String value) {
    return 'INR módosítva: $value';
  }

  @override
  String sodiumCap(String value) {
    return 'Nátrium módosítva: $value mmol/L';
  }

  @override
  String get calculationLimits => 'Számítási határértékek';

  @override
  String get calculationLimitsText =>
      'A következő határértékeket az EuroTransplant előírásai szerint automatikusan alkalmazzuk a pontszám kiszámításakor:';

  @override
  String get limitsDialysis =>
      'Ha az elmúlt 7 napban kétszer vagy többször végeztek dialízist, a kreatinin értéke 2,5 mg/dL-re (221,1 µmol/L) lesz beállítva.';

  @override
  String get limitsAnticoagulant =>
      'Ha vérhígító tablettákat szed (warfarin, acenocumarol, rivaroxaban, apixaban, dabigatran, edoxaban), az INR értéke 1,0-ra lesz állítva.';

  @override
  String get eurotransplantSource => 'Forrás: EuroTransplant MELD-kalkulátor';

  @override
  String get eurotransplantUrl =>
      'https://www.eurotransplant.org/meld-calculator';
}
