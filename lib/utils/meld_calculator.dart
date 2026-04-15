import 'dart:math';

class MeldCalculator {
  // --- Unit conversions ---
  static double creatinineMgToUmol(double mg) => mg * 88.42;
  static double creatinineUmolToMg(double umol) => umol / 88.42;
  static double bilirubinMgToUmol(double mg) => mg * 17.1;
  static double bilirubinUmolToMg(double umol) => umol / 17.1;

  // --- Caps (all in mg/dL / mmol/L) ---
  // Lower caps guarantee positive values — no extra floor needed.
  static double clampCreatinine(double mg) => mg.clamp(0.7, 2.5);
  static double clampBilirubin(double mg)  => mg.clamp(0.3, 27.0);
  static double clampInr(double inr)       => inr.clamp(1.0, 2.6);
  static double clampSodium(double na)     => na.clamp(120.0, 138.6);

  /// Computes reMELD-Na. Inputs in mg/dL and mmol/L.
  /// Caps applied internally. _safe() removed — it was incorrectly
  /// forcing values like bilirubin 0.33 up to 1.0 before capping.
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

    final double naDiff = 138.6 - na;

    return 7.85
        + 9.03  * log(cr)
        + 2.97  * log(bili)
        + 9.52  * log(i)
        + 0.392 * naDiff
        - 0.351 * naDiff * log(cr);
  }
}
