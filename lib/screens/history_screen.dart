import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remeldna_calculator/l10n/app_localizations.dart';
import '../db/database_helper.dart';
import '../models/meld_entry.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Future<List<MeldEntry>> _entriesFuture;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    _entriesFuture = DatabaseHelper.instance.getAllEntries();
  }

  Future<void> _delete(int id) async {
    await DatabaseHelper.instance.deleteEntry(id);
    setState(() => _load());
  }

  Color _scoreColor(double score) {
    if (score < 10) return Colors.green;
    if (score < 20) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l.scoreHistory)),
      body: FutureBuilder<List<MeldEntry>>(
        future: _entriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final entries = snapshot.data ?? [];
          if (entries.isEmpty) {
            return Center(
              child: Text(l.noScoresSaved,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey)),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final e = entries[index];
              final color = _scoreColor(e.reMeldNaScore);
              return Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 68, height: 68,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            e.reMeldNaScore.toStringAsFixed(1),
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l.sampleLabel(DateFormat('dd MMM yyyy').format(e.collectionDate)),
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              l.enteredLabel(DateFormat('dd MMM yyyy  HH:mm').format(e.timestamp)),
                              style: const TextStyle(color: Colors.grey, fontSize: 11),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Krea: ${e.creatinine}  Bili: ${e.bilirubin}  INR: ${e.inr}  Na: ${e.sodium.toStringAsFixed(0)}',
                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                        tooltip: l.delete,
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(l.deleteEntry),
                              content: Text(l.deleteConfirm),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l.cancel)),
                                TextButton(onPressed: () => Navigator.pop(context, true),
                                  child: Text(l.delete, style: const TextStyle(color: Colors.red))),
                              ],
                            ),
                          );
                          if (confirm == true && e.id != null) _delete(e.id!);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
