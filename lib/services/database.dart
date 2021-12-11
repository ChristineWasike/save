import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:save/models/account.dart';

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
    return await goalCollection.document().setData(<String, dynamic>{
      'user_id': uid, // User Id
      'category': category,
      'title': title,
      'goal': goal,
      'frequency': frequency, // weekly - $50
      'amount': amount,
      'currentBalance':
          currentBalance, // incremenent by amount deposited - $200, $20
      // 'amountDeposited': amountDeposited,
      // timestamp field to track most recent change to currentBalance
      // the timestamp, currentBalance and goal id- Timestamp collection/table
    });
  }

  // Collection Desposits - Date, Amount, Goal_id

  Future createDeposit(String date, int amount) {}

  // Get Accounts
  List<Account> _accountListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Account(
        firstName: doc.data['firstName'] ?? '',
        lastName: doc.data['lastName'] ?? '',
        password: doc.data['password'] ?? '',
        pin: doc.data['pin'] ?? 0,
        accountBalance: doc.data['accountBalance'] ?? 0.0,
        email: doc.data['email'] ?? '',
      );
    }).toList();
  }

  // Get users stream
  Stream<List<Account>> get users {
    return userCollection.snapshots().map(_accountListFromSnapshot);
  }

  // Get Goals
  Stream<QuerySnapshot> get goals {
    return userCollection.snapshots();
  }
}
