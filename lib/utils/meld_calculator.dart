import 'dart:math';

class MeldCalculator {
  static double _safe(double value) => value < 1.0 ? 1.0 : value;

  // --- Unit conversions ---
  static double creatinineMgToUmol(double mg) => mg * 88.42;
  static double creatinineUmolToMg(double umol) => umol / 88.42;
  static double bilirubinMgToUmol(double mg) => mg * 17.1;
  static double bilirubinUmolToMg(double umol) => umol / 17.1;

  // --- Caps (all in mg/dL / mmol/L) ---
  static double clampCreatinine(double mg) => mg.clamp(0.7, 2.5);
  static double clampBilirubin(double mg)  => mg.clamp(0.3, 27.0);
  static double clampInr(double inr)       => inr.clamp(1.0, 2.6);
  static double clampSodium(double na)     => na.clamp(120.0, 138.6);

  /// Computes reMELD-Na. All inputs in mg/dL and mmol/L.
  /// Caps are applied internally before calculation.
  static double computeReMeldNa({
    required double bilirubin,
    required double creatinine,
    required double inr,
    required double sodium,
  }) {
    final double cr   = clampCreatinine(creatinine);
    final double bili = clampBilirubin(bilirubin);
    final double i    = clampInr(inr);
    final double na   = clampSodium(sodium);

    final double lnCr   = log(_safe(cr));
    final double lnBili = log(_safe(bili));
    final double lnInr  = log(_safe(i));
    final double naDiff = 138.6 - na;

    return 7.85
        + 9.03  * lnCr
        + 2.97  * lnBili
        + 9.52  * lnInr
        + 0.392 * naDiff
        - 0.351 * naDiff * lnCr;
  }
}
