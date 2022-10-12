import 'package:cloud_firestore/cloud_firestore.dart';

class Weight {
  String weight;
  String? autoID;

  Weight({required this.weight});

  factory Weight.fromJson(Map<String, dynamic> json) => _weightFromJson(json);

  factory Weight.fromSnapshot(DocumentSnapshot snapshot) {
    final newWeight = Weight.fromJson(snapshot.data() as Map<String, dynamic>);
    newWeight.autoID = snapshot.reference.id;

    return newWeight;
  }

  Map<String, dynamic> toJson() => _weightToJson(this);
}

Weight _weightFromJson(Map<String, dynamic> json) {
  return Weight(
    weight: json['weight'] as String,
  );
}

Map<String, dynamic> _weightToJson(Weight instance) => <String, dynamic>{
      'weight': instance.weight,
    };
