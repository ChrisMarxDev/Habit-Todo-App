import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mindful/logic/repositories/shared_preferences_repository.dart';
import 'package:mindful/util/analytics.dart';
import 'package:mindful/util/logging.dart';

@injectable
@singleton
class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final SharedPreferencesRepository sharedPreferencesRepository;

  AuthRepository({
    required this.sharedPreferencesRepository,
    required this.firebaseAuth,
  });

  String get getUserId => sharedPreferencesRepository.getUserId();

  User? currentLogin() {
    return firebaseAuth.currentUser;
  }

  Stream<User?> listenToAuth() async* {
    await for (final user in firebaseAuth.authStateChanges()) {
      if (user != null) {
        final id = user.uid;
        await sharedPreferencesRepository.setUserId(id);
      }
      yield user;
    }
  }

  Future<UserCredential> signInAnonymously() async {
    final creds = await firebaseAuth.signInAnonymously();
    final id = creds.user?.uid ?? '';
    await sharedPreferencesRepository.setUserId(id);
    logger
      ..i('Logged in with id: $id')
      ..i(creds.credential?.token ?? '');
    Analytics.setUserId(id);
    return creds;
  }

  // for testing and debugging
  Future<void> forceLogout() async {
    await FirebaseAuth.instance.signOut();
    await sharedPreferencesRepository.clearUserId();
  }
}
