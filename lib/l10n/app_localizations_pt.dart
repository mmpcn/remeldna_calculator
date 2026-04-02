// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'reMELD-Na';

  @override
  String get calculate => 'Calcular reMELD-Na';

  @override
  String get save => 'Guardar';

  @override
  String get saved => 'Guardado';

  @override
  String get newEntry => 'Novo';

  @override
  String get quit => 'Sair';

  @override
  String get bloodCollectionDate => 'Data da Colheita';

  @override
  String get creatinine => 'Creatinina';

  @override
  String get bilirubin => 'Bilirrubina';

  @override
  String get inr => 'INR';

  @override
  String get sodium => 'Sódio / Na (mmol/L)';

  @override
  String get creatinineHint => 'ex. 1,0';

  @override
  String get bilirubinHint => 'ex. 1,5';

  @override
  String get inrHint => 'ex. 1,2';

  @override
  String get sodiumHint => 'ex. 138';

  @override
  String get required => 'Obrigatório';

  @override
  String get enterPositiveNumber => 'Introduza um número positivo';

  @override
  String get sodiumRange => 'Intervalo típico: 100–160 mmol/L';

  @override
  String get scoreSavedToHistory => 'Score guardado no histórico.';

  @override
  String sampleLabel(String date) {
    return 'Amostra: $date';
  }

  @override
  String get scoreHistory => 'Histórico de Scores';

  @override
  String get noScoresSaved =>
      'Nenhum score guardado.\nCalcule e guarde primeiro um score.';

  @override
  String enteredLabel(String date) {
    return 'Introduzido: $date';
  }

  @override
  String get deleteEntry => 'Eliminar entrada?';

  @override
  String get deleteConfirm => 'Esta ação não pode ser desfeita.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get aboutTitle => 'Sobre reMELD-Na';

  @override
  String get aboutWhat => 'O que é o reMELD-Na?';

  @override
  String get aboutWhatText =>
      'O reMELD-Na (Refitted Model for End-Stage Liver Disease with Sodium) é um sistema de pontuação utilizado para avaliar a gravidade da doença hepática crónica e prever a mortalidade a 90 dias em doentes em lista de espera para transplante hepático.\n\nÉ um refinamento dos scores clássicos MELD e MELD-Na, recalibrado em coortes contemporâneas de doentes.';

  @override
  String get formula => 'Fórmula';

  @override
  String get variables => 'Variáveis';

  @override
  String get varCreatinine => 'Marcador da função renal';

  @override
  String get varBilirubin => 'Marcador da função hepática';

  @override
  String get varINR => 'Marcador da coagulação hepática';

  @override
  String get varSodium => 'Nível sérico de sódio';

  @override
  String get varLn => 'Logaritmo natural (base e)';

  @override
  String get scoreInterpretation => 'Interpretação do Score';

  @override
  String get mortality2 => '~2% mortalidade a 3 meses';

  @override
  String get mortality6 => '~6–20% mortalidade a 3 meses';

  @override
  String get mortality20 => '~20–52% mortalidade a 3 meses';

  @override
  String get mortalityCritical => '>52% mortalidade a 3 meses — Crítico';

  @override
  String get reference => 'Referência';

  @override
  String get referenceText => 'Kim WR et al. Hepatology, 2021.';

  @override
  String get developer => 'Autora';

  @override
  String get licenseText =>
      'Publicado sob a Licença MIT — livre para usar, modificar e distribuir com atribuição.';

  @override
  String get disclaimer =>
      'Esta aplicação destina-se apenas como ferramenta de apoio à decisão clínica. Não substitui o julgamento clínico. Os scores devem sempre ser interpretados no contexto do quadro clínico completo.';

  @override
  String get mort2 => '~2% mortalidade a 3 meses';

  @override
  String get mort6to20 => '~6–20% mortalidade a 3 meses';

  @override
  String get mort20to52 => '~20–52% mortalidade a 3 meses';

  @override
  String get mortCritical => '>52% — Crítico';

  @override
  String get tooltipHistory => 'Ver Histórico';

  @override
  String get tooltipInfo => 'Sobre reMELD-Na';

  @override
  String get dialysisQuestion => 'Fez diálise nos últimos 7 dias?';

  @override
  String get dialysisSubtitle =>
      'Duas vezes ou mais — a creatinina será definida automaticamente como 2,5 mg/dL (221,1 µmol/L)';

  @override
  String get dialysisTooltip =>
      'A diálise é um tratamento que limpa o sangue quando os rins já não conseguem fazê-lo. Se fez este tratamento 2 ou mais vezes na última semana, marque esta opção — o valor da creatinina será definido automaticamente.';

  @override
  String get anticoagulantQuestion =>
      'Toma comprimidos para diluir o sangue (por via oral, não por injeção)?';

  @override
  String get anticoagulantSubtitle =>
      'Varfarina, acenocumarol, rivaroxabano, apixabano, dabigatrano ou edoxabano — INR será definido como 1,0';

  @override
  String get anticoagulantTooltip =>
      'Alguns comprimidos anticoagulantes tomados por via oral afetam o valor do INR de forma a torná-lo pouco fiável para este cálculo. Injeções como a heparina NÃO contam. Se toma algum dos comprimidos indicados, marque esta opção — o seu INR será definido automaticamente como 1,0.';

  @override
  String get unitMgDl => 'mg/dL';

  @override
  String get unitUmolL => 'µmol/L';

  @override
  String get capsApplied => 'Limites aplicados';

  @override
  String creatinineCap(String value) {
    return 'Creatinina ajustada para $value mg/dL';
  }

  @override
  String bilirubinCap(String value) {
    return 'Bilirrubina ajustada para $value mg/dL';
  }

  @override
  String inrCap(String value) {
    return 'INR ajustado para $value';
  }

  @override
  String sodiumCap(String value) {
    return 'Sódio ajustado para $value mmol/L';
  }

  @override
  String get calculationLimits => 'Limites de Cálculo';

  @override
  String get calculationLimitsText =>
      'Os seguintes limites são aplicados automaticamente no cálculo do score, conforme definido pela EuroTransplant:';

  @override
  String get limitsDialysis =>
      'Se a diálise foi realizada duas ou mais vezes nos últimos 7 dias, a creatinina é definida como 2,5 mg/dL (221,1 µmol/L).';

  @override
  String get limitsAnticoagulant =>
      'Se tomar comprimidos anticoagulantes (varfarina, acenocumarol, rivaroxabano, apixabano, dabigatrano, edoxabano), o INR é definido como 1,0.';

  @override
  String get eurotransplantSource =>
      'Fonte: Calculadora MELD da EuroTransplant';

  @override
  String get eurotransplantUrl =>
      'https://www.eurotransplant.org/meld-calculator';
}
