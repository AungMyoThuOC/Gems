import 'package:cloud_firestore/cloud_firestore.dart';

class Price {
  int amount;
  String? autoID;

  Price(this.amount);

  factory Price.fromJson(Map<String, dynamic> json) => _priceFromJson(json);

  factory Price.fromSnapshot(DocumentSnapshot snapshot) {
    final newPrice = Price.fromJson(snapshot.data() as Map<String, dynamic>);
    newPrice.autoID = snapshot.reference.id;

    return newPrice;
  }

  Map<String, dynamic> toJson() => _priceToJson(this);
}

Price _priceFromJson(Map<String, dynamic> json) {
  return Price(
    json['amount'] as int,
  );
}

Map<String, dynamic> _priceToJson(Price instance) => <String, dynamic>{
      'amount': instance.amount,
    };
