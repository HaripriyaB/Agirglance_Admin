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
      UserModel updateUser = await _firestoreService.getUser(uid);
      updateUser = UserModel(
          uid,
          updateUser.fullName,
          updateUser.email,
          updateUser.isAdmin,
          updateUser.dob,
          (updateUser.points == null ? 0 : updateUser.points) + addPoints,
          updateUser.university,
          updateUser.qualification);
      await _firestoreService.createOrUpdateUser(updateUser);
      return "true";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
