import 'package:firebase_auth/firebase_auth.dart';
import 'package:save/models/user.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

// authentication change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

// sign in anonymously
  Future signInAnonymously() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and passowrd
  Future registerWithEmailAndPassword(
      String firstName, String lastName, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // creating a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData(firstName, lastName, email, password, 0.0, 0000);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and passowrd
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // create
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString);
      return null;
    }
  }

  Future createNewGoal(String category, String title, int goal,
      String frequency, int amount, int currentBalance, int amountDeposited) {
    // return await si
  }
}
