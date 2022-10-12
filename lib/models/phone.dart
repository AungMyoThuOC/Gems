import 'package:cloud_firestore/cloud_firestore.dart';

class PhoneNo {
  int number;
  String? autoID;

  PhoneNo(this.number);

  factory PhoneNo.fromJson(Map<String, dynamic> json) => _phoneNoFromJson(json);

  factory PhoneNo.formSnapshot(DocumentSnapshot snapshot) {
    final newPhoneNo =
        PhoneNo.fromJson(snapshot.data() as Map<String, dynamic>);
    newPhoneNo.autoID = snapshot.reference.id;

    return newPhoneNo;
  }

  Map<String, dynamic> toJson() => _phoneNoToJson(this);
}

PhoneNo _phoneNoFromJson(Map<String, dynamic> json) {
  return PhoneNo(
    json['number'] as int,
  );
}

Map<String, dynamic> _phoneNoToJson(PhoneNo instance) => <String, dynamic>{
      'number': instance.number,
    };
