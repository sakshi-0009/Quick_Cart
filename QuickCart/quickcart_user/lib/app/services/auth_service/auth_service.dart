
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants/contains.dart';
import '../boot_service/boot_services.dart';

part 'auth_service_impl.dart';

final class AuthService extends GetxService implements Bootable, AuthServiceImpl {
  static AuthService get instance => Get.find<AuthService>();

  late final FirebaseAuth _firebaseAuth;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _firebaseAuth = FirebaseAuth.instance;
  }

  @override
  Future<Either<Failure, UserCredential>> loginWithEmail({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return right(userCredential);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.code.tr, stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> registerWithEmail({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.sendEmailVerification();
      return right(userCredential);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.message.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> registerWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) return left(Failure('Login with Google Failure', StackTrace.current));
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message.toString(), StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailResetPassword({required String email}) async {
    try {
      final _result = await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(_result);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification({User? user}) async {
    if (user == null) return left(Failure('User is null', StackTrace.current));

    try {
      await user.sendEmailVerification();
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      final GoogleSignIn googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) await googleSignIn.signOut();
      final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
      await firebaseMessaging.deleteToken();

      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword({required String newPassword, required User user}) async {
    try {
      await user.updatePassword(newPassword);
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Stream<User?> get firebaseAuthUserStream => _firebaseAuth.authStateChanges();

  @override
  User? get getFirebaseAuthUser => _firebaseAuth.currentUser;

}
