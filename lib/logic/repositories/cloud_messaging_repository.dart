import 'package:firebase_messaging/firebase_messaging.dart';

class CloudMessagingRepository {
  final FirebaseMessaging _messaging;

  CloudMessagingRepository({FirebaseMessaging? messaging})
      : _messaging = messaging ?? FirebaseMessaging.instance;

  Future<String?> getToken() {
    return _messaging.getToken();
  }
}
