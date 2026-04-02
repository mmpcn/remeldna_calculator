class MeldEntry {
  final int? id;
  final double bilirubin;
  final double creatinine;
  final double sodium;
  final double inr;
  final double reMeldNaScore;
  final DateTime collectionDate;  // date blood was collected
  final DateTime timestamp;       // date entry was saved

  MeldEntry({
    this.id,
    required this.bilirubin,
    required this.creatinine,
    required this.sodium,
    required this.inr,
    required this.reMeldNaScore,
    required this.collectionDate,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bilirubin': bilirubin,
      'creatinine': creatinine,
      'sodium': sodium,
      'inr': inr,
      'remeld_na_score': reMeldNaScore,
      'collection_date': collectionDate.toIso8601String(),
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory MeldEntry.fromMap(Map<String, dynamic> map) {
    return MeldEntry(
      id: map['id'],
      bilirubin: map['bilirubin'],
      creatinine: map['creatinine'],
      sodium: map['sodium'],
      inr: map['inr'],
      reMeldNaScore: map['remeld_na_score'],
      collectionDate: DateTime.parse(map['collection_date']),
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
