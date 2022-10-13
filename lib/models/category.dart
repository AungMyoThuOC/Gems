import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String name;
  String? autoID;

  Category({
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _categoryFromJson(json);

  factory Category.fromSnapshot(DocumentSnapshot snapshot) {
    final newCategory =
        Category.fromJson(snapshot.data() as Map<String, dynamic>);
    newCategory.autoID = snapshot.reference.id;

    return newCategory;
  }

  Map<String, dynamic> toJson() => _categoryToJson(this);

  @override
  String toString() => 'Category<$name>';
}

Category _categoryFromJson(Map<String, dynamic> json) {
  return Category(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _categoryToJson(Category instance) => <String, dynamic> {
  'name': instance.name
  };
