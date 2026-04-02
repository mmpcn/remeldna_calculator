import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/meld_entry.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('meldna.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    // version bumped to 2 to trigger onUpgrade for existing installs
    return await openDatabase(path, version: 2,
        onCreate: _createDB, onUpgrade: _upgradeDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE meld_entries (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bilirubin REAL NOT NULL,
        creatinine REAL NOT NULL,
        sodium REAL NOT NULL,
        inr REAL NOT NULL,
        remeld_na_score REAL NOT NULL,
        collection_date TEXT NOT NULL,
        timestamp TEXT NOT NULL
      )
    ''');
  }

  // Migrate existing DB: add collection_date column if upgrading from v1
  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(
        "ALTER TABLE meld_entries ADD COLUMN collection_date TEXT NOT NULL DEFAULT '2000-01-01T00:00:00.000'",
      );
    }
  }

  Future<int> insertEntry(MeldEntry entry) async {
    final db = await database;
    return await db.insert('meld_entries', entry.toMap());
  }

  Future<List<MeldEntry>> getAllEntries() async {
    final db = await database;
    final result = await db.query(
      'meld_entries',
      orderBy: 'collection_date DESC',
    );
    return result.map((map) => MeldEntry.fromMap(map)).toList();
  }

  Future<int> deleteEntry(int id) async {
    final db = await database;
    return await db.delete('meld_entries', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
