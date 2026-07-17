import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/meld_entry.dart';

class ExportService {
  static final _dateFmt = DateFormat('yyyy-MM-dd');
  static final _filenameFmt = DateFormat('yyyyMMdd_HHmmss');

  // ---- CSV ----
  static String _toCsv(List<MeldEntry> entries) {
    final buf = StringBuffer();
    buf.writeln(
        'Collection Date,Creatinine (mg/dL),Bilirubin (mg/dL),INR,Sodium (mmol/L),reMELD-Na,Entry Timestamp');
    for (final e in entries) {
      buf.writeln([
        _dateFmt.format(e.collectionDate),
        e.creatinine,
        e.bilirubin,
        e.inr,
        e.sodium,
        e.reMeldNaScore.toStringAsFixed(2),
        e.timestamp.toIso8601String(),
      ].join(','));
    }
    return buf.toString();
  }

  // ---- JSON ----
  static String _toJson(List<MeldEntry> entries) {
    final list = entries.map((e) => {
      'collectionDate': _dateFmt.format(e.collectionDate),
      'creatinine_mgdl': e.creatinine,
      'bilirubin_mgdl': e.bilirubin,
      'inr': e.inr,
      'sodium_mmoll': e.sodium,
      'remeldna_score': e.reMeldNaScore,
      'entryTimestamp': e.timestamp.toIso8601String(),
    }).toList();
    return const JsonEncoder.withIndent('  ').convert(list);
  }

  // ---- Parse JSON for import ----
  static List<Map<String, dynamic>> parseJson(String content) {
    final decoded = jsonDecode(content);
    if (decoded is List) {
      return decoded.cast<Map<String, dynamic>>();
    }
    throw const FormatException('Invalid JSON format');
  }

  static MeldEntry entryFromJson(Map<String, dynamic> m) {
    return MeldEntry(
      bilirubin:     (m['bilirubin_mgdl'] as num).toDouble(),
      creatinine:    (m['creatinine_mgdl'] as num).toDouble(),
      sodium:        (m['sodium_mmoll'] as num).toDouble(),
      inr:           (m['inr'] as num).toDouble(),
      reMeldNaScore: (m['remeldna_score'] as num).toDouble(),
      collectionDate: DateTime.parse(m['collectionDate']),
      timestamp:      DateTime.parse(m['entryTimestamp']),
    );
  }

  // ---- Save to Downloads ----
  static Future<String> saveToDownloads(
      List<MeldEntry> entries, String format) async {
    final content = format == 'csv' ? _toCsv(entries) : _toJson(entries);
    final ext = format == 'csv' ? 'csv' : 'json';
    final filename =
        'remeldna_${_filenameFmt.format(DateTime.now())}.$ext';

    // On Android, getExternalStorageDirectory points to app-specific external storage.
    // For Downloads we use /storage/emulated/0/Download directly.
    Directory dir;
    if (Platform.isAndroid) {
      dir = Directory('/storage/emulated/0/Download');
      if (!await dir.exists()) {
        dir = (await getExternalStorageDirectory())!;
      }
    } else {
      dir = await getApplicationDocumentsDirectory();
    }

    final file = File('${dir.path}/$filename');
    await file.writeAsString(content);
    return file.path;
  }

  // ---- Share via system share sheet ----
  static Future<void> shareFile(
      List<MeldEntry> entries, String format) async {
    final content = format == 'csv' ? _toCsv(entries) : _toJson(entries);
    final ext = format == 'csv' ? 'csv' : 'json';
    final filename =
        'remeldna_${_filenameFmt.format(DateTime.now())}.$ext';

    // Write to temp dir first, then share
    final tmpDir = await getTemporaryDirectory();
    final file = File('${tmpDir.path}/$filename');
    await file.writeAsString(content);

    await Share.shareXFiles(
      [XFile(file.path)],
      subject: 'reMELD-Na scores export',
    );
  }
}
