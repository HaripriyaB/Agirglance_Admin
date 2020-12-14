import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      _currentUser = UserModel(
          uid,
          _currentUser.fullName,
          currentUser.email,
          currentUser.isAdmin,
          currentUser.dob,
          (currentUser.points == null ? 0 : currentUser.points) + addPoints,
          currentUser.university,
          currentUser.qualification);
      await _firestoreService.createOrUpdateUser(_currentUser);
      return "true";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
