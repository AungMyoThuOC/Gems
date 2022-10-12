// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'models/type.dart';

class DataRepository {
  CollectionReference ref = FirebaseFirestore.instance.collection("gem");
  CollectionReference reference = FirebaseFirestore.instance.collection("record");
  Future userData(String email) async {
    return await ref.doc(email).set({
      "email": FirebaseAuth.instance.currentUser!.email,
    });
  }

  Future updateuserDate(String date) async {
    return await ref
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('date')
        .doc()
        .set({'date': FirebaseAuth.instance.currentUser!.email});
  }

  Future updateuserType(String type) async {
    return await ref
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('type')
        .doc()
        .set({'type': FirebaseAuth.instance.currentUser!.email});
  }

  Future updateUserweight(String weight) async {
    return await ref
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('weight')
        .doc()
        .set({'weight': FirebaseAuth.instance.currentUser!.email});
  }

  Future updateUserprice(String price) async {
    return await ref
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('price')
        .doc()
        .set({'price': FirebaseAuth.instance.currentUser!.email});
  }

  Future updateUserFromWhom(String fromwhom) async {
    return await ref
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('fromwhom')
        .doc()
        .set({'fromwhom': FirebaseAuth.instance.currentUser!.email});
  }

  Future updateUserphone(String phoneno) async {
    return await ref
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('phoneno')
        .doc()
        .set({'phoneno': FirebaseAuth.instance.currentUser!.email});
  }

  Future updateUserremark(String remark) async {
    return await ref
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('remark')
        .doc()
        .set({'remark': FirebaseAuth.instance.currentUser!.email});
  }

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('gem');
  
  Stream<QuerySnapshot> getAddDate() {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('date')
        .snapshots();
  }

  Stream<QuerySnapshot> getAddtype() {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('type')
        .snapshots();
  }

  Stream<QuerySnapshot> getAddWeight() {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('weight')
        .snapshots();
  }

  Stream<QuerySnapshot> getAddPrice() {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('price')
        .snapshots();
  }

  Stream<QuerySnapshot> getAddFromWhom() {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('fromwhom')
        .snapshots();
  }

  Stream<QuerySnapshot> getAddPhone() {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('phone')
        .snapshots();
  }

  Stream<QuerySnapshot> getAddRemark() {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('remark')
        .snapshots();
  }

  Future<DocumentReference> addDate(Date date) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Type')
        .add(date.toJson());
  }

  Future<DocumentReference> addType(Type type) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Type')
        .add(type.toJson());
  }

  Future<DocumentReference> addWeight(Weight weight) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Weight')
        .add(weight.toJson());
  }

  Future<DocumentReference> addPrice(Price price) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Price')
        .add(price.toJson());
  }

  Future<DocumentReference> addFromWhom(FromWhom fromWhom) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('fromWhom')
        .add(fromWhom.toJson());
  }

  Future<DocumentReference> addPhoneno(PhoneNo phoneNo) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('phoneNo')
        .add(phoneNo.toJson());
  }

  Future<DocumentReference> addRemark(Remark remark) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('remark')
        .add(remark.toJson());
  }

  Future updateDate(String id, Date date) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Type')
        .doc(id)
        .update(date.toJson());
  }

  Future updateType(String id, Type type) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Type')
        .doc(id)
        .update(type.toJson());
  }

  Future updateWeight(String id, Weight weight) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Weight')
        .doc(id)
        .update(weight.toJson());
  }

  Future updatePrice(String id, Price price) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Price')
        .doc(id)
        .update(price.toJson());
  }

  Future updateFromWhom(String id, FromWhom fromWhom) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('fromWhom')
        .doc(id)
        .update(fromWhom.toJson());
  }

  Future updatePhoneNo(String id, PhoneNo phoneNo) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('phoneNo')
        .doc(id)
        .update(phoneNo.toJson());
  }

  Future updateRemark(String id, Remark remark) async {
    return await ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Remark')
        .doc(id)
        .update(remark.toJson());
  }

  Future deleteDate(String id) async {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Date')
        .doc(id)
        .delete();
  }

  Future deleteType(String id) async {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Type')
        .doc(id)
        .delete();
  }

  Future deleteWeight(String id) async {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Weight')
        .doc(id)
        .delete();
  }

  Future deletePrice(String id) async {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Price')
        .doc(id)
        .delete();
  }

  Future deleteFromWhom(String id) async {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('fromWhom')
        .doc(id)
        .delete();
  }

  Future deletePhoneNo(String id) async {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('phoneNo')
        .doc(id)
        .delete();
  }

  Future deleteRemark(String id) async {
    return ref
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('Remark')
        .doc(id)
        .delete();
  }

  Future<dynamic> fetchImages() async {
    List<dynamic> files = [];
    final ListResult result =
        await FirebaseStorage.instance.ref().child('Images').list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMata = await file.getMetadata();

      files.add(
        fileUrl,
      );
    });
    FirebaseFirestore.instance.collection("record").doc("Images").set({
      "url": files,
    });

    return files;
  }
}
