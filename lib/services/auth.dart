import 'package:firebase_auth/firebase_auth.dart';
import 'package:save/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

// Authentication change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

// Sign in anonymously
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

  // Sign in with email and passowrd

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString);
      return null;
    }
  }
}
