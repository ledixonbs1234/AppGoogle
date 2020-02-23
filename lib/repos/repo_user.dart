
import 'package:firebase_auth/firebase_auth.dart';

class RepoUser{
  final FirebaseAuth _firebaseAuth;
  RepoUser({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signInWithCredentials({String email, String password}) {
    return _firebaseAuth.signInWithEmailAndPassword(email:email,password: password);
  }

  Future<void> signUp({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email:email, password:password);
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }

  Future<bool> isSignIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String> getUser() async {
    return _firebaseAuth.currentUser().toString();
  }
}