import 'package:firebase_auth/firebase_auth.dart';
import '../Models/user_model.dart';
import './firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final FirestoreService _firestoreService = FirestoreService();
  UserModel _currentUser;

  UserModel get currentUser => _currentUser;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await _populateCurrentUser(_firebaseAuth.currentUser);
      return _currentUser.isAdmin.toString();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future _populateCurrentUser(User firebaseUser) async {
    if (firebaseUser != null) {
      _currentUser = await _firestoreService.getUser(firebaseUser.uid);
    }
  }

  Future<String> addPoints(String uid, int addPoints) async {
    try {
      String valueReturn;
      await _firestoreService.getUser(uid).then((updateUser) {
        int points = updateUser.points.toInt() + addPoints;
        updateUser = UserModel(
            uid,
            updateUser.fullName,
            updateUser.email,
            updateUser.isAdmin,
            updateUser.dob,
            points,
            updateUser.university,
            updateUser.qualification,
            updateUser.isBanned);
        _firestoreService.createOrUpdateUser(updateUser);
        valueReturn = "true";
        return "true";
      });
      return valueReturn;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
