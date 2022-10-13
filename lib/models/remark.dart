import 'package:cloud_firestore/cloud_firestore.dart';

class Remark {
  String target;
  String? autoID;

  Remark({required this.target});

  factory Remark.fromJson(Map<String, dynamic> json) => _remarkFromJson(json);

  factory Remark.fromSnapshot(DocumentSnapshot snapshot) {
    final newRemark = Remark.fromJson(snapshot.data() as Map<String, dynamic>);
    newRemark.autoID = snapshot.reference.id;

    return newRemark;
  }

  Map<String, dynamic> toJson() => _remarkToJson(this);
}

Remark _remarkFromJson(Map<String, dynamic> json) {
  return Remark(
    target: json['remark'] as String,
  );
}

Map<String, dynamic> _remarkToJson(Remark instance) => <String, dynamic>{
      'remark': instance.target,
    };
