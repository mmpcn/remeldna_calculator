import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../db/database_helper.dart';
import '../utils/export_service.dart';

class ExportScreen extends StatefulWidget {
  const ExportScreen({super.key});
  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  bool _busy = false;

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> _exportSave(String format) async {
    setState(() => _busy = true);
    try {
      final entries = await DatabaseHelper.instance.getAllEntries();
      final path = await ExportService.saveToDownloads(entries, format);
      final filename = path.split('/').last;
      if (mounted) {
        _showSnack(AppLocalizations.of(context)!.exportSuccess(filename));
      }
    } catch (e) {
      if (mounted) {
        _showSnack(AppLocalizations.of(context)!.exportError(e.toString()));
      }
    } finally {
      setState(() => _busy = false);
    }
  }

  Future<void> _exportShare(String format) async {
    setState(() => _busy = true);
    try {
      final entries = await DatabaseHelper.instance.getAllEntries();
      await ExportService.shareFile(entries, format);
    } catch (e) {
      if (mounted) {
        _showSnack(AppLocalizations.of(context)!.exportError(e.toString()));
      }
    } finally {
      setState(() => _busy = false);
    }
  }

  Future<void> _importJson() async {
    final l = AppLocalizations.of(context)!;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l.importConfirmTitle),
        content: Text(l.importConfirm),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l.cancel)),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(l.importJson)),
        ],
      ),
    );
    if (confirm != true) return;

    setState(() => _busy = true);
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );
      if (result == null || result.files.isEmpty) {
        setState(() => _busy = false);
        return;
      }

      final path = result.files.single.path!;
      final content = await File(path).readAsString();
      final maps = ExportService.parseJson(content);
      int count = 0;
      for (final m in maps) {
        final entry = ExportService.entryFromJson(m);
        await DatabaseHelper.instance.insertEntry(entry);
        count++;
      }
      if (mounted) _showSnack(l.importSuccess(count));
    } catch (e) {
      if (mounted) {
        _showSnack(AppLocalizations.of(context)!.importError(e.toString()));
      }
    } finally {
      setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l.exportImport)),
      body: _busy
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(l.export,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                _actionTile(
                  icon: Icons.table_chart_outlined,
                  color: Colors.green,
                  title: l.exportCsv,
                  subtitle: 'Excel, Google Sheets',
                  onTap: () => _exportSave('csv'),
                ),
                _actionTile(
                  icon: Icons.share,
                  color: Colors.green.shade300,
                  title: l.shareCsv,
                  subtitle: 'WhatsApp, Email, Drive...',
                  onTap: () => _exportShare('csv'),
                ),
                const Divider(height: 28),
                _actionTile(
                  icon: Icons.code,
                  color: Colors.blue,
                  title: l.exportJson,
                  subtitle: 'Downloads folder',
                  onTap: () => _exportSave('json'),
                ),
                _actionTile(
                  icon: Icons.share,
                  color: Colors.blue.shade300,
                  title: l.shareJson,
                  subtitle: 'WhatsApp, Email, Drive...',
                  onTap: () => _exportShare('json'),
                ),
                const Divider(height: 28),
                Text(l.importJson,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                _actionTile(
                  icon: Icons.upload_file,
                  color: Colors.orange,
                  title: l.importJson,
                  subtitle: '.json file',
                  onTap: _importJson,
                ),
              ],
            ),
    );
  }

  Widget _actionTile({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(title),
        subtitle: Text(subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
