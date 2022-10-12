import 'package:cloud_firestore/cloud_firestore.dart';

class Type {
  String type;
  String? autoID;

  Type({
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _typeFromJson(json);

  factory Type.fromSnapshot(DocumentSnapshot snapshot) {
    final newType = Type.fromJson(snapshot.data() as Map<String, dynamic>);

    newType.autoID = snapshot.reference.id;
    
    return newType;
  }

  Map<String, dynamic> toJson() => _typeToJson(this);

  @override
  String toString() => 'Record<$type>';
}

Type _typeFromJson(Map<String, dynamic> json) {
  return Type(type: json['type'] as String);
}

Map<String, dynamic> _typeToJson(Type instance) => <String, dynamic>{
      'type': instance.type,
    };
