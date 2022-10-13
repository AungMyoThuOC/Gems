import 'package:cloud_firestore/cloud_firestore.dart';

class FromWhom {
  String name;
  String? autoID;

  FromWhom({required this.name});

  factory FromWhom.fromJson(Map<String, dynamic> json) => _remarkFromJson(json);

  factory FromWhom.fromSnapshot(DocumentSnapshot snapshot) {
    final newRemark = FromWhom.fromJson(snapshot.data() as Map<String, dynamic>);
    newRemark.autoID = snapshot.reference.id;

    return newRemark;
  }

  Map<String, dynamic> toJson() => _remarkToJson(this);
}

FromWhom _remarkFromJson(Map<String, dynamic> json) {
  return FromWhom(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _remarkToJson(FromWhom instance) => <String, dynamic>{
      'name': instance.name,
    };
