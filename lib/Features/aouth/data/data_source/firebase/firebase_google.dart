import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/Features/aouth/data/model/google_model/login_google_model.dart';

class FirebaseManeger{

  static Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // المستخدم ألغى تسجيل الدخول

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      final User? firebaseUser = userCredential.user;
      if (firebaseUser == null) return;

      print("Google User Name: ${googleUser.displayName}");
      print("Firebase User Name: ${firebaseUser.displayName}");

      // تحديث `displayName` في FirebaseAuth إذا كان مفقودًا
      if (firebaseUser.displayName == null || firebaseUser.displayName!.isEmpty) {
        await firebaseUser.updateProfile(displayName: googleUser.displayName);
        await firebaseUser.reload();
        print("Updated Firebase User Name: ${firebaseUser.displayName}");
      }

      // تحديث البيانات في Firestore
      final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

      final DocumentSnapshot userDoc =
      await usersCollection.doc(firebaseUser.uid).get();

      if (!userDoc.exists) {
        LoginGoogle userModel = LoginGoogle(
          id: firebaseUser.uid,
          name: googleUser.displayName ?? firebaseUser.displayName ?? 'No Name',
          email: firebaseUser.email ?? 'No Email',
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );

        await usersCollection.doc(firebaseUser.uid).set(userModel.toJson());
      }

    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }
}