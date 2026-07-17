import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:remeldna_calculator/l10n/app_localizations.dart';
import '../db/database_helper.dart';
import '../models/meld_entry.dart';
import '../utils/meld_calculator.dart';
import 'history_screen.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _creatinineController = TextEditingController();
  final _bilirubinController  = TextEditingController();
  final _inrController        = TextEditingController();
  final _sodiumController     = TextEditingController();

  DateTime _collectionDate    = DateTime.now();
  bool _creatinineInUmol      = false;
  bool _bilirubinInUmol       = false;
  bool _onDialysis            = false;
  bool _onAnticoagulant       = false;
  double? _score;
  bool _saved                 = false;
  List<String> _clampMessages = [];

  @override
  void dispose() {
    _creatinineController.dispose();
    _bilirubinController.dispose();
    _inrController.dispose();
    _sodiumController.dispose();
    super.dispose();
  }

  double _creatinineMg() {
    final raw = double.tryParse(_creatinineController.text.replaceAll(',', '.')) ?? 0;
    return _creatinineInUmol ? MeldCalculator.creatinineUmolToMg(raw) : raw;
  }

  double _bilirubinMg() {
    final raw = double.tryParse(_bilirubinController.text.replaceAll(',', '.')) ?? 0;
    return _bilirubinInUmol ? MeldCalculator.bilirubinUmolToMg(raw) : raw;
  }

  void _switchCreatinineUnit(bool toUmol) {
    final raw = double.tryParse(_creatinineController.text.replaceAll(',', '.'));
    if (raw != null) {
      _creatinineController.text = toUmol
          ? MeldCalculator.creatinineMgToUmol(raw).toStringAsFixed(1)
          : MeldCalculator.creatinineUmolToMg(raw).toStringAsFixed(2);
    }
    setState(() => _creatinineInUmol = toUmol);
  }

  void _switchBilirubinUnit(bool toUmol) {
    final raw = double.tryParse(_bilirubinController.text.replaceAll(',', '.'));
    if (raw != null) {
      _bilirubinController.text = toUmol
          ? MeldCalculator.bilirubinMgToUmol(raw).toStringAsFixed(1)
          : MeldCalculator.bilirubinUmolToMg(raw).toStringAsFixed(2);
    }
    setState(() => _bilirubinInUmol = toUmol);
  }

  void _onDialysisChanged(bool? val) {
    setState(() {
      _onDialysis = val ?? false;
      if (_onDialysis) {
        _creatinineController.text = _creatinineInUmol ? '221.1' : '2.5';
      }
    });
  }

  void _onAnticoagulantChanged(bool? val) {
    setState(() {
      _onAnticoagulant = val ?? false;
      if (_onAnticoagulant) _inrController.text = '1.0';
    });
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _collectionDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() { _collectionDate = picked; _saved = false; });
  }

  void _calculate() {
    if (!_formKey.currentState!.validate()) return;
    final l = AppLocalizations.of(context)!;

    final crMg   = _creatinineMg();
    final biliMg = _bilirubinMg();
    final inr    = double.tryParse(_inrController.text.replaceAll(',', '.')) ?? 1.0;
    final na     = double.tryParse(_sodiumController.text.replaceAll(',', '.')) ?? 138.6;

    final crClamped   = MeldCalculator.clampCreatinine(crMg);
    final biliClamped = MeldCalculator.clampBilirubin(biliMg);
    final inrClamped  = MeldCalculator.clampInr(inr);
    final naClamped   = MeldCalculator.clampSodium(na);

    final msgs = <String>[];
    if ((crClamped - crMg).abs() > 0.001)     msgs.add(l.creatinineCap(crClamped.toStringAsFixed(2)));
    if ((biliClamped - biliMg).abs() > 0.001) msgs.add(l.bilirubinCap(biliClamped.toStringAsFixed(2)));
    if ((inrClamped - inr).abs() > 0.001)     msgs.add(l.inrCap(inrClamped.toStringAsFixed(1)));
    if ((naClamped - na).abs() > 0.001)       msgs.add(l.sodiumCap(naClamped.toStringAsFixed(1)));

    setState(() {
      _score = MeldCalculator.computeReMeldNa(
          bilirubin: biliMg, creatinine: crMg, inr: inr, sodium: na);
      _clampMessages = msgs;
      _saved = false;
    });
  }

  Future<void> _saveEntry() async {
    if (_score == null) return;
    await DatabaseHelper.instance.insertEntry(MeldEntry(
      bilirubin:      _bilirubinMg(),
      creatinine:     _creatinineMg(),
      sodium:         double.tryParse(_sodiumController.text.replaceAll(',', '.')) ?? 0,
      inr:            double.tryParse(_inrController.text.replaceAll(',', '.')) ?? 1.0,
      reMeldNaScore:  _score!,
      collectionDate: _collectionDate,
      timestamp:      DateTime.now(),
    ));
    setState(() => _saved = true);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.scoreSavedToHistory)));
    }
  }

  void _clearForm() {
    _creatinineController.clear();
    _bilirubinController.clear();
    _inrController.clear();
    _sodiumController.clear();
    setState(() {
      _collectionDate   = DateTime.now();
      _creatinineInUmol = false;
      _bilirubinInUmol  = false;
      _onDialysis       = false;
      _onAnticoagulant  = false;
      _score            = null;
      _clampMessages    = [];
      _saved            = false;
    });
  }

  String? _validatePositive(String? value) {
    final l = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) return l.required;
    final n = double.tryParse(value.replaceAll(',', '.'));
    if (n == null || n <= 0) return l.enterPositiveNumber;
    return null;
  }

  String? _validateSodium(String? value) {
    final l = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) return l.required;
    final n = double.tryParse(value.replaceAll(',', '.'));
    if (n == null || n <= 0) return l.enterPositiveNumber;
    if (n < 100 || n > 160) return l.sodiumRange;
    return null;
  }

  Color _scoreColor(double s) {
    if (s < 10) return Colors.green;
    if (s < 20) return Colors.orange;
    return Colors.red;
  }

  String _interpretation(double s, AppLocalizations l) {
    if (s < 10) return l.mort2;
    if (s < 20) return l.mort6to20;
    if (s < 30) return l.mort20to52;
    return l.mortCritical;
  }

  // Tooltip icon with info popup
  Widget _infoIcon(String message) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text(message, style: const TextStyle(fontSize: 14, height: 1.5)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 6),
        child: Icon(Icons.info_outline, size: 20, color: Colors.teal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.appTitle),
        actions: [
          IconButton(icon: const Icon(Icons.info_outline), tooltip: l.tooltipInfo,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InfoScreen()))),
          IconButton(icon: const Icon(Icons.history), tooltip: l.tooltipHistory,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryScreen()))),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // Date picker
              InkWell(
                onTap: _pickDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: l.bloodCollectionDate,
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  child: Text(DateFormat('dd MMM yyyy').format(_collectionDate),
                      style: const TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),

              // CREATININE with unit toggle
              _buildFieldWithUnitToggle(
                controller: _creatinineController,
                label: l.creatinine,
                hint: _creatinineInUmol ? 'e.g. 88' : 'e.g. 1.0',
                validator: _onDialysis ? (_) => null : _validatePositive,
                enabled: !_onDialysis,
                inUmol: _creatinineInUmol,
                onUnitSwitch: _switchCreatinineUnit,
              ),
              const SizedBox(height: 4),
              // Dialysis checkbox with tooltip
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      value: _onDialysis,
                      onChanged: _onDialysisChanged,
                      title: Text(l.dialysisQuestion,
                          style: const TextStyle(fontSize: 14)),
                      subtitle: Text(l.dialysisSubtitle,
                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  _infoIcon(l.dialysisTooltip),
                  const SizedBox(width: 4),
                ],
              ),
              const SizedBox(height: 8),

              // BILIRUBIN with unit toggle
              _buildFieldWithUnitToggle(
                controller: _bilirubinController,
                label: l.bilirubin,
                hint: _bilirubinInUmol ? 'e.g. 17' : 'e.g. 1.5',
                validator: _validatePositive,
                enabled: true,
                inUmol: _bilirubinInUmol,
                onUnitSwitch: _switchBilirubinUnit,
              ),
              const SizedBox(height: 12),

              // INR
              TextFormField(
                controller: _inrController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                enabled: !_onAnticoagulant,
                decoration: InputDecoration(
                  labelText: l.inr,
                  hintText: 'e.g. 1.2',
                  border: const OutlineInputBorder(),
                ),
                validator: _validatePositive,
              ),
              const SizedBox(height: 4),
              // Anticoagulant checkbox with tooltip
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      value: _onAnticoagulant,
                      onChanged: _onAnticoagulantChanged,
                      title: Text(l.anticoagulantQuestion,
                          style: const TextStyle(fontSize: 14)),
                      subtitle: Text(l.anticoagulantSubtitle,
                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  _infoIcon(l.anticoagulantTooltip),
                  const SizedBox(width: 4),
                ],
              ),
              const SizedBox(height: 8),

              // SODIUM
              TextFormField(
                controller: _sodiumController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: l.sodium,
                  hintText: l.sodiumHint,
                  border: const OutlineInputBorder(),
                ),
                validator: _validateSodium,
              ),
              const SizedBox(height: 20),

              // Calculate button
              ElevatedButton.icon(
                onPressed: _calculate,
                icon: const Icon(Icons.calculate),
                label: Text(l.calculate),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14)),
              ),

              // Result
              if (_score != null) ...[
                const SizedBox(height: 24),
                if (_clampMessages.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.amber.shade700.withOpacity(0.4)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l.capsApplied,
                            style: TextStyle(fontWeight: FontWeight.w600,
                                fontSize: 13, color: Colors.amber.shade800)),
                        const SizedBox(height: 4),
                        ...(_clampMessages.map((m) => Text('• $m',
                            style: TextStyle(fontSize: 12, color: Colors.amber.shade900)))),
                      ],
                    ),
                  ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(l.sampleLabel(DateFormat('dd MMM yyyy').format(_collectionDate)),
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 16),
                        Text('reMELD-Na',
                            style: TextStyle(fontSize: 14,
                                color: Colors.grey[600], letterSpacing: 1.2)),
                        const SizedBox(height: 4),
                        Text(_score!.toStringAsFixed(1),
                            style: TextStyle(fontSize: 56,
                                fontWeight: FontWeight.bold, color: _scoreColor(_score!))),
                        Text(_interpretation(_score!, l),
                            style: TextStyle(color: _scoreColor(_score!),
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 20),
                        Row(children: [
                          Expanded(child: OutlinedButton.icon(
                            onPressed: _clearForm,
                            icon: const Icon(Icons.refresh),
                            label: Text(l.newEntry),
                          )),
                          const SizedBox(width: 12),
                          Expanded(child: ElevatedButton.icon(
                            onPressed: _saved ? null : _saveEntry,
                            icon: Icon(_saved ? Icons.check : Icons.save),
                            label: Text(_saved ? l.saved : l.save),
                          )),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 32),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(l.quit,
                    style: TextStyle(color: Colors.grey[500], fontSize: 13)),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldWithUnitToggle({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String? Function(String?)? validator,
    required bool enabled,
    required bool inUmol,
    required void Function(bool) onUnitSwitch,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            enabled: enabled,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              border: const OutlineInputBorder(),
            ),
            validator: validator,
          ),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: ToggleButtons(
            isSelected: [!inUmol, inUmol],
            onPressed: (i) => onUnitSwitch(i == 1),
            borderRadius: BorderRadius.circular(8),
            constraints: const BoxConstraints(minWidth: 56, minHeight: 56),
            children: const [
              Text('mg/dL', style: TextStyle(fontSize: 11)),
              Text('µmol/L', style: TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ],
    );
  }
}
