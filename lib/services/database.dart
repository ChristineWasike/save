import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:save/models/goal.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  final CollectionReference goalCollection =
      Firestore.instance.collection('goals');

  final CollectionReference depositCollection =
      Firestore.instance.collection('deposits');

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
      int amount, int currentBalance) async {
    return await goalCollection.document().setData(<String, dynamic>{
      'user_id': uid, // User Id
      'category': category,
      'title': title,
      'goal': goal,
      'frequency': frequency, // weekly - $50
      'amount': amount,
      'currentBalance':
          currentBalance, // incremenent by amount deposited - $200, $20
    });
  }

  // Collection Desposits - Date, Amount, Goal_id
  Future createDeposit(DateTime date, int amount, String goalId) async {
    return await depositCollection.document().setData(
        <String, dynamic>{'date': date, 'amount': amount, 'goalId': goalId});
  }

  List<Goal> _goalListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Goal(
          userId: doc.data['user_id'] ?? '',
          category: doc.data['category'] ?? '',
          title: doc.data['title'] ?? '',
          goal: doc.data['goal'] ?? 0,
          frequency: doc.data['frequency'] ?? '',
          amount: doc.data['amount'] ?? 0,
          currentBalance: doc.data['currentBalance'] ?? 0);
    }).toList();
  }

  // Get Goals
  Stream<List<Goal>> get goals {
    return goalCollection.snapshots().map(_goalListFromSnapShot);
  }
}
