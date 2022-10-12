import 'package:cloud_firestore/cloud_firestore.dart';

class Date {
  DateTime date;
  String? autoId;

  Date({required this.date});

  factory Date.fromJson(Map<String, dynamic> json) => _dateFromJson(json);

  factory Date.fromSnapshot(DocumentSnapshot snapshot) {
    final newRecod = Date.fromJson(snapshot.data() as Map<String, dynamic>);
    newRecod.autoId = snapshot.reference.id;
    return newRecod;
  }

  Map<String, dynamic> toJson() => _dateToJson(this);

  @override
  String toString() => 'Date<$date>';
}

Date _dateFromJson(Map<String, dynamic> json) {
  return Date(date: (json['date'] as Timestamp).toDate());
}

Map<String, dynamic> _dateToJson(Date instance) => <String, dynamic>{
      'date': instance.date,
    };
