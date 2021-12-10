import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  final CollectionReference goalCollection =
      Firestore.instance.collection('goals');

  // Setting up a user
  Future updateUserData(String firstName, String lastName, String email,
      String password, double accountBalance, int pin) async {
    return await userCollection.document(uid).setData(<String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'accountBalance': accountBalance,
      'pin': pin,
    });
  }

  // Creating a goal
  Future createGoal(String category, String title, int goal, String frequency,
      int amount, int currentBalance, int amountDeposited) async {
    return await goalCollection.document(uid).collection('user_goals').add(<String, dynamic>{
      'category': category,
      'title': title,
      'goal': goal,
      'frequency': frequency,
      'amount': amount,
      'currentBalance': currentBalance,
      'amountDeposited': amountDeposited,
      // timestamp field to track most recent change to currentBalance
      // the timestamp, currentBalance and goal id- Timestamp collection/table
     
    });
  }

  // Get users stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
