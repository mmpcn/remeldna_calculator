// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'reMELD-Na';

  @override
  String get calculate => 'Calculer reMELD-Na';

  @override
  String get save => 'Enregistrer';

  @override
  String get saved => 'Enregistré';

  @override
  String get newEntry => 'Nouveau';

  @override
  String get quit => 'Quitter';

  @override
  String get bloodCollectionDate => 'Date du prélèvement sanguin';

  @override
  String get creatinine => 'Créatinine';

  @override
  String get bilirubin => 'Bilirubine';

  @override
  String get inr => 'INR';

  @override
  String get sodium => 'Sodium / Na (mmol/L)';

  @override
  String get creatinineHint => 'ex. 1,0';

  @override
  String get bilirubinHint => 'ex. 1,5';

  @override
  String get inrHint => 'ex. 1,2';

  @override
  String get sodiumHint => 'ex. 138';

  @override
  String get required => 'Obligatoire';

  @override
  String get enterPositiveNumber => 'Entrez un nombre positif';

  @override
  String get sodiumRange => 'Plage typique : 100–160 mmol/L';

  @override
  String get scoreSavedToHistory => 'Score enregistré dans l\'historique.';

  @override
  String sampleLabel(String date) {
    return 'Échantillon : $date';
  }

  @override
  String get scoreHistory => 'Historique des scores';

  @override
  String get noScoresSaved =>
      'Aucun score enregistré.\nCalculez et enregistrez d\'abord un score.';

  @override
  String enteredLabel(String date) {
    return 'Saisi le : $date';
  }

  @override
  String get deleteEntry => 'Supprimer l\'entrée ?';

  @override
  String get deleteConfirm => 'Cette action est irréversible.';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get aboutTitle => 'À propos de reMELD-Na';

  @override
  String get aboutWhat => 'Qu\'est-ce que le reMELD-Na ?';

  @override
  String get aboutWhatText =>
      'Le reMELD-Na (Refitted Model for End-Stage Liver Disease with Sodium) est un système de score utilisé pour évaluer la gravité de la maladie hépatique chronique et prédire la mortalité à 90 jours chez les patients en attente de transplantation hépatique.\n\nIl s\'agit d\'un perfectionnement des scores MELD et MELD-Na classiques, recalibré sur des cohortes de patients contemporains.';

  @override
  String get formula => 'Formule';

  @override
  String get variables => 'Variables';

  @override
  String get varCreatinine => 'Marqueur de la fonction rénale';

  @override
  String get varBilirubin => 'Marqueur de la fonction hépatique';

  @override
  String get varINR => 'Marqueur de la coagulation hépatique';

  @override
  String get varSodium => 'Taux de sodium sérique';

  @override
  String get varLn => 'Logarithme naturel (base e)';

  @override
  String get scoreInterpretation => 'Interprétation du score';

  @override
  String get mortality2 => '~2% de mortalité à 3 mois';

  @override
  String get mortality6 => '~6–20% de mortalité à 3 mois';

  @override
  String get mortality20 => '~20–52% de mortalité à 3 mois';

  @override
  String get mortalityCritical => '>52% de mortalité à 3 mois — Critique';

  @override
  String get reference => 'Référence';

  @override
  String get referenceText => 'Kim WR et al. Hepatology, 2021.';

  @override
  String get developer => 'Développeuse';

  @override
  String get licenseText =>
      'Publié sous licence MIT — libre d\'utilisation, de modification et de distribution avec attribution.';

  @override
  String get disclaimer =>
      'Cette application est uniquement destinée à servir d\'outil d\'aide à la décision clinique. Elle ne remplace pas le jugement clinique. Les scores doivent toujours être interprétés dans le contexte clinique global.';

  @override
  String get mort2 => '~2% mortalité à 3 mois';

  @override
  String get mort6to20 => '~6–20% mortalité à 3 mois';

  @override
  String get mort20to52 => '~20–52% mortalité à 3 mois';

  @override
  String get mortCritical => '>52% — Critique';

  @override
  String get tooltipHistory => 'Voir l\'historique';

  @override
  String get tooltipInfo => 'À propos de reMELD-Na';

  @override
  String get dialysisQuestion =>
      'Avez-vous eu une dialyse au cours des 7 derniers jours ?';

  @override
  String get dialysisSubtitle =>
      'Deux fois ou plus — la créatinine sera automatiquement fixée à 2,5 mg/dL (221,1 µmol/L)';

  @override
  String get dialysisTooltip =>
      'La dialyse est un traitement qui nettoie votre sang lorsque vos reins ne peuvent plus le faire. Si vous avez eu ce traitement 2 fois ou plus au cours de la semaine passée, cochez cette case — votre valeur de créatinine sera définie automatiquement.';

  @override
  String get anticoagulantQuestion =>
      'Prenez-vous des comprimés fluidifiants (par la bouche, pas en injection) ?';

  @override
  String get anticoagulantSubtitle =>
      'Warfarine, acénocoumarol, rivaroxaban, apixaban, dabigatran ou edoxaban — l\'INR sera fixé à 1,0';

  @override
  String get anticoagulantTooltip =>
      'Certains comprimés anticoagulants pris par la bouche affectent la valeur de l\'INR de façon à la rendre peu fiable pour ce calcul. Les injections comme l\'héparine ne comptent PAS. Si vous prenez l\'un des comprimés listés, cochez cette case — votre INR sera automatiquement fixé à 1,0.';

  @override
  String get unitMgDl => 'mg/dL';

  @override
  String get unitUmolL => 'µmol/L';

  @override
  String get capsApplied => 'Limites appliquées';

  @override
  String creatinineCap(String value) {
    return 'Créatinine ajustée à $value mg/dL';
  }

  @override
  String bilirubinCap(String value) {
    return 'Bilirubine ajustée à $value mg/dL';
  }

  @override
  String inrCap(String value) {
    return 'INR ajusté à $value';
  }

  @override
  String sodiumCap(String value) {
    return 'Sodium ajusté à $value mmol/L';
  }

  @override
  String get calculationLimits => 'Limites de calcul';

  @override
  String get calculationLimitsText =>
      'Les limites suivantes sont appliquées automatiquement lors du calcul du score, telles que définies par EuroTransplant :';

  @override
  String get limitsDialysis =>
      'Si la dialyse a été effectuée deux fois ou plus au cours des 7 derniers jours, la créatinine est fixée à 2,5 mg/dL (221,1 µmol/L).';

  @override
  String get limitsAnticoagulant =>
      'Si des comprimés anticoagulants sont pris (warfarine, acénocoumarol, rivaroxaban, apixaban, dabigatran, edoxaban), l\'INR est fixé à 1,0.';

  @override
  String get eurotransplantSource =>
      'Source : Calculateur MELD d\'EuroTransplant';

  @override
  String get eurotransplantUrl =>
      'https://www.eurotransplant.org/meld-calculator';
}
