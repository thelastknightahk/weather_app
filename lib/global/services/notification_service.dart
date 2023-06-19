import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService{
  static FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static void requestPermission() async{
    PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {

    } else {

    }

  }
  static void getUserToken(){
    _firebaseMessaging.getToken().then((value) {
      print("Token $value");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground notifications here
      print('Received foreground notification: ${message.notification!.title}');
    });
  }
  static void subscribeToTopic() async {
    await FirebaseMessaging.instance.subscribeToTopic('all');
  }
}