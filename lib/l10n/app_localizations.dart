import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_sl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('fr'),
    Locale('hr'),
    Locale('hu'),
    Locale('nl'),
    Locale('pt'),
    Locale('sl')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'reMELD-Na'**
  String get appTitle;

  /// No description provided for @calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate reMELD-Na'**
  String get calculate;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// No description provided for @newEntry.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newEntry;

  /// No description provided for @quit.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get quit;

  /// No description provided for @bloodCollectionDate.
  ///
  /// In en, this message translates to:
  /// **'Blood Collection Date'**
  String get bloodCollectionDate;

  /// No description provided for @creatinine.
  ///
  /// In en, this message translates to:
  /// **'Creatinine'**
  String get creatinine;

  /// No description provided for @bilirubin.
  ///
  /// In en, this message translates to:
  /// **'Bilirubin'**
  String get bilirubin;

  /// No description provided for @inr.
  ///
  /// In en, this message translates to:
  /// **'INR'**
  String get inr;

  /// No description provided for @sodium.
  ///
  /// In en, this message translates to:
  /// **'Sodium / Na (mmol/L)'**
  String get sodium;

  /// No description provided for @creatinineHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 1.0'**
  String get creatinineHint;

  /// No description provided for @bilirubinHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 1.5'**
  String get bilirubinHint;

  /// No description provided for @inrHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 1.2'**
  String get inrHint;

  /// No description provided for @sodiumHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 138'**
  String get sodiumHint;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @enterPositiveNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a positive number'**
  String get enterPositiveNumber;

  /// No description provided for @sodiumRange.
  ///
  /// In en, this message translates to:
  /// **'Typical range: 100–160 mmol/L'**
  String get sodiumRange;

  /// No description provided for @scoreSavedToHistory.
  ///
  /// In en, this message translates to:
  /// **'Score saved to history.'**
  String get scoreSavedToHistory;

  /// No description provided for @sampleLabel.
  ///
  /// In en, this message translates to:
  /// **'Sample: {date}'**
  String sampleLabel(String date);

  /// No description provided for @scoreHistory.
  ///
  /// In en, this message translates to:
  /// **'Score History'**
  String get scoreHistory;

  /// No description provided for @noScoresSaved.
  ///
  /// In en, this message translates to:
  /// **'No scores saved yet.\nCalculate and save a score first.'**
  String get noScoresSaved;

  /// No description provided for @enteredLabel.
  ///
  /// In en, this message translates to:
  /// **'Entered: {date}'**
  String enteredLabel(String date);

  /// No description provided for @deleteEntry.
  ///
  /// In en, this message translates to:
  /// **'Delete entry?'**
  String get deleteEntry;

  /// No description provided for @deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone.'**
  String get deleteConfirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About reMELD-Na'**
  String get aboutTitle;

  /// No description provided for @aboutWhat.
  ///
  /// In en, this message translates to:
  /// **'What is reMELD-Na?'**
  String get aboutWhat;

  /// No description provided for @aboutWhatText.
  ///
  /// In en, this message translates to:
  /// **'reMELD-Na (Refitted Model for End-Stage Liver Disease with Sodium) is a scoring system used to assess the severity of chronic liver disease and predict 90-day mortality in patients awaiting liver transplantation.\n\nIt is a refinement of the classic MELD and MELD-Na scores, recalibrated on contemporary patient cohorts to improve accuracy.'**
  String get aboutWhatText;

  /// No description provided for @formula.
  ///
  /// In en, this message translates to:
  /// **'Formula'**
  String get formula;

  /// No description provided for @variables.
  ///
  /// In en, this message translates to:
  /// **'Variables'**
  String get variables;

  /// No description provided for @varCreatinine.
  ///
  /// In en, this message translates to:
  /// **'Marker of kidney function'**
  String get varCreatinine;

  /// No description provided for @varBilirubin.
  ///
  /// In en, this message translates to:
  /// **'Marker of liver function'**
  String get varBilirubin;

  /// No description provided for @varINR.
  ///
  /// In en, this message translates to:
  /// **'Marker of liver\'s clotting ability'**
  String get varINR;

  /// No description provided for @varSodium.
  ///
  /// In en, this message translates to:
  /// **'Serum sodium level'**
  String get varSodium;

  /// No description provided for @varLn.
  ///
  /// In en, this message translates to:
  /// **'Natural logarithm (base e)'**
  String get varLn;

  /// No description provided for @scoreInterpretation.
  ///
  /// In en, this message translates to:
  /// **'Score Interpretation'**
  String get scoreInterpretation;

  /// No description provided for @mortality2.
  ///
  /// In en, this message translates to:
  /// **'~2% 3-month mortality'**
  String get mortality2;

  /// No description provided for @mortality6.
  ///
  /// In en, this message translates to:
  /// **'~6–20% 3-month mortality'**
  String get mortality6;

  /// No description provided for @mortality20.
  ///
  /// In en, this message translates to:
  /// **'~20–52% 3-month mortality'**
  String get mortality20;

  /// No description provided for @mortalityCritical.
  ///
  /// In en, this message translates to:
  /// **'>52% 3-month mortality — Critical'**
  String get mortalityCritical;

  /// No description provided for @reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get reference;

  /// No description provided for @referenceText.
  ///
  /// In en, this message translates to:
  /// **'Kim WR et al. Hepatology, 2021.'**
  String get referenceText;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// No description provided for @licenseText.
  ///
  /// In en, this message translates to:
  /// **'Released under the MIT License — free to use, modify and distribute with attribution.'**
  String get licenseText;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'This app is intended as a clinical decision support tool only. It does not replace clinical judgment. Always interpret scores in the context of the full clinical picture.'**
  String get disclaimer;

  /// No description provided for @mort2.
  ///
  /// In en, this message translates to:
  /// **'~2% 3-month mortality'**
  String get mort2;

  /// No description provided for @mort6to20.
  ///
  /// In en, this message translates to:
  /// **'~6–20% 3-month mortality'**
  String get mort6to20;

  /// No description provided for @mort20to52.
  ///
  /// In en, this message translates to:
  /// **'~20–52% 3-month mortality'**
  String get mort20to52;

  /// No description provided for @mortCritical.
  ///
  /// In en, this message translates to:
  /// **'>52% — Critical'**
  String get mortCritical;

  /// No description provided for @tooltipHistory.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get tooltipHistory;

  /// No description provided for @tooltipInfo.
  ///
  /// In en, this message translates to:
  /// **'About reMELD-Na'**
  String get tooltipInfo;

  /// No description provided for @dialysisQuestion.
  ///
  /// In en, this message translates to:
  /// **'Did you have dialysis in the last 7 days?'**
  String get dialysisQuestion;

  /// No description provided for @dialysisSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Twice or more — creatinine will be set to 2.5 mg/dL (221.1 µmol/L) automatically'**
  String get dialysisSubtitle;

  /// No description provided for @dialysisTooltip.
  ///
  /// In en, this message translates to:
  /// **'Dialysis is a treatment that cleans your blood when your kidneys cannot do it properly. If you had this treatment 2 or more times in the past week, tick this box — your creatinine value will be set automatically.'**
  String get dialysisTooltip;

  /// No description provided for @anticoagulantQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you taking blood-thinning tablets (by mouth, not injection)?'**
  String get anticoagulantQuestion;

  /// No description provided for @anticoagulantSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Warfarin, acenocoumarol, rivaroxaban, apixaban, dabigatran or edoxaban — INR will be set to 1.0'**
  String get anticoagulantSubtitle;

  /// No description provided for @anticoagulantTooltip.
  ///
  /// In en, this message translates to:
  /// **'Some blood-thinning tablets taken by mouth affect the INR measurement in a way that makes it unreliable for this calculation. Injections such as heparin do NOT count. If you are taking any of the tablets listed, tick this box — your INR will be set to 1.0 automatically.'**
  String get anticoagulantTooltip;

  /// No description provided for @unitMgDl.
  ///
  /// In en, this message translates to:
  /// **'mg/dL'**
  String get unitMgDl;

  /// No description provided for @unitUmolL.
  ///
  /// In en, this message translates to:
  /// **'µmol/L'**
  String get unitUmolL;

  /// No description provided for @capsApplied.
  ///
  /// In en, this message translates to:
  /// **'Limits applied'**
  String get capsApplied;

  /// No description provided for @creatinineCap.
  ///
  /// In en, this message translates to:
  /// **'Creatinine adjusted to {value} mg/dL'**
  String creatinineCap(String value);

  /// No description provided for @bilirubinCap.
  ///
  /// In en, this message translates to:
  /// **'Bilirubin adjusted to {value} mg/dL'**
  String bilirubinCap(String value);

  /// No description provided for @inrCap.
  ///
  /// In en, this message translates to:
  /// **'INR adjusted to {value}'**
  String inrCap(String value);

  /// No description provided for @sodiumCap.
  ///
  /// In en, this message translates to:
  /// **'Sodium adjusted to {value} mmol/L'**
  String sodiumCap(String value);

  /// No description provided for @calculationLimits.
  ///
  /// In en, this message translates to:
  /// **'Calculation Limits'**
  String get calculationLimits;

  /// No description provided for @calculationLimitsText.
  ///
  /// In en, this message translates to:
  /// **'The following limits are applied automatically when calculating the score, as defined by EuroTransplant:'**
  String get calculationLimitsText;

  /// No description provided for @limitsDialysis.
  ///
  /// In en, this message translates to:
  /// **'If dialysis was performed twice or more in the last 7 days, creatinine is set to 2.5 mg/dL (221.1 µmol/L).'**
  String get limitsDialysis;

  /// No description provided for @limitsAnticoagulant.
  ///
  /// In en, this message translates to:
  /// **'If blood-thinning tablets are taken (warfarin, acenocoumarol, rivaroxaban, apixaban, dabigatran, edoxaban), INR is set to 1.0.'**
  String get limitsAnticoagulant;

  /// No description provided for @eurotransplantSource.
  ///
  /// In en, this message translates to:
  /// **'Source: EuroTransplant MELD Calculator'**
  String get eurotransplantSource;

  /// No description provided for @eurotransplantUrl.
  ///
  /// In en, this message translates to:
  /// **'https://www.eurotransplant.org/meld-calculator'**
  String get eurotransplantUrl;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'fr',
        'hr',
        'hu',
        'nl',
        'pt',
        'sl'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'sl':
      return AppLocalizationsSl();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
