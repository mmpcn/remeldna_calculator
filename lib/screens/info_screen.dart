import 'package:flutter/material.dart';
import 'package:remeldna_calculator/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l.aboutTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _sectionTitle(context, l.aboutWhat),
            const SizedBox(height: 8),
            Text(l.aboutWhatText,
                style: const TextStyle(fontSize: 15, height: 1.5)),

            const SizedBox(height: 28),
            _sectionTitle(context, l.formula),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.withOpacity(0.3)),
              ),
              child: const Text(
                'reMELD-Na =\n'
                '  7.85\n'
                '  + 9.03 × ln(Creatinine)\n'
                '  + 2.97 × ln(Bilirubin)\n'
                '  + 9.52 × ln(INR)\n'
                '  + 0.392 × (138.6 − Na)\n'
                '  − 0.351 × (138.6 − Na) × ln(Creatinine)',
                style: TextStyle(fontFamily: 'monospace', fontSize: 14, height: 1.8),
              ),
            ),

            const SizedBox(height: 28),
            _sectionTitle(context, l.variables),
            const SizedBox(height: 8),
            _variableRow('Creatinine', 'mg/dL', l.varCreatinine),
            _variableRow('Bilirubin',  'mg/dL', l.varBilirubin),
            _variableRow('INR',        '',      l.varINR),
            _variableRow('Na',         'mmol/L', l.varSodium),
            _variableRow('ln',         '',      l.varLn),

            const SizedBox(height: 28),
            _sectionTitle(context, l.scoreInterpretation),
            const SizedBox(height: 8),
            _interpretationRow(Colors.green,      '< 10',    l.mortality2),
            _interpretationRow(Colors.orange,     '10 – 19', l.mortality6),
            _interpretationRow(Colors.deepOrange, '20 – 29', l.mortality20),
            _interpretationRow(Colors.red,        '≥ 30',    l.mortalityCritical),

            const SizedBox(height: 28),

            // --- Calculation limits section ---
            _sectionTitle(context, l.calculationLimits),
            const SizedBox(height: 8),
            Text(l.calculationLimitsText,
                style: const TextStyle(fontSize: 14, height: 1.5)),
            const SizedBox(height: 12),

            // Limits table
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.06),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal.withOpacity(0.25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _limitRow('Creatinine', '0.7 – 2.5 mg/dL', '61.9 – 221.1 µmol/L'),
                  _limitRow('Bilirubin',  '0.3 – 27 mg/dL',  '5.1 – 461.7 µmol/L'),
                  _limitRow('INR',        '1.0 – 2.6',        ''),
                  _limitRow('Sodium',     '120 – 138.6 mmol/L', ''),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text('• ${l.limitsDialysis}',
                style: const TextStyle(fontSize: 13, height: 1.6)),
            const SizedBox(height: 6),
            Text('• ${l.limitsAnticoagulant}',
                style: const TextStyle(fontSize: 13, height: 1.6)),
            const SizedBox(height: 12),

            // EuroTransplant link
            InkWell(
              onTap: () async {
                final uri = Uri.parse(l.eurotransplantUrl);
                if (await canLaunchUrl(uri)) launchUrl(uri,
                    mode: LaunchMode.externalApplication);
              },
              child: Row(
                children: [
                  const Icon(Icons.open_in_new, size: 16, color: Colors.teal),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      l.eurotransplantSource,
                      style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            SelectableText(
              l.eurotransplantUrl,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 28),
            _sectionTitle(context, l.reference),
            const SizedBox(height: 8),
            Text(l.referenceText,
                style: const TextStyle(
                    fontSize: 14, height: 1.5, fontStyle: FontStyle.italic)),

            const SizedBox(height: 28),
            _sectionTitle(context, l.developer),
            const SizedBox(height: 8),
            const Text('Margarida Castro Neves',
                style: TextStyle(fontSize: 15, height: 1.5)),
            const SizedBox(height: 4),
            Text(l.licenseText,
                style: const TextStyle(
                    fontSize: 13, height: 1.5, color: Colors.grey)),

            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.amber.shade700.withOpacity(0.4)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning_amber_rounded,
                      color: Colors.amber.shade700, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(l.disclaimer,
                        style: const TextStyle(fontSize: 13, height: 1.5)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String text) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold));
  }

  Widget _variableRow(String name, String unit, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 100,
              child: Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14))),
          if (unit.isNotEmpty)
            Text('($unit)  ',
                style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Expanded(
              child: Text(description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey))),
        ],
      ),
    );
  }

  Widget _interpretationRow(Color color, String range, String meaning) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(width: 14, height: 14,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 10),
          SizedBox(width: 70,
              child: Text(range,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14))),
          Expanded(
              child: Text(meaning, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _limitRow(String name, String val1, String val2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 90,
              child: Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13))),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(val1, style: const TextStyle(fontSize: 13)),
                if (val2.isNotEmpty)
                  Text(val2,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
