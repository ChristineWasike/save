import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(double accountBalance, int pin) async {
    return await userCollection.document(uid).setData({
      'accountBalance': accountBalance,
      'pin': pin,
    });
  }
}
