import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Request permission for notifications (only for iOS)
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    // Get the token for this device
    String? token = await messaging.getToken();
    return token;
  }
  return null;
}
