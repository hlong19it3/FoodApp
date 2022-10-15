// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:platform_device_id/platform_device_id.dart';

// import '../../../domain/entities/user.entity.dart';

// class UserTokenEntityHelper {
//   static Future<UserTokenEntity> generateUserToken() async {
//     String? email = FirebaseAuth.instance.currentUser!.email;
//     String? deviceId = await PlatformDeviceId.getDeviceId;
//     DateTime createdAt = DateTime.now();
//     DateTime expired = createdAt.add(
//       const Duration(
//         days: 15,
//       ),
//     );
//     return UserTokenEntity(
//       email: email,
//       deviceId: deviceId,
//       createdAt: createdAt,
//       expired: expired,
//     );
//   }
// }
