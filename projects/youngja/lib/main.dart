import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/about/about.screen.dart';
import 'screens/home/home.screen.dart';
import 'screens/user/login.screen.dart';
import 'screens/user/profile.screen.dart';
import 'screens/user/register.screen.dart';
import 'services/globals.dart';
import 'services/route_names.dart';

void main() async {
  await GetStorage.init();
  runApp(AioApp());
}

class AioApp extends StatelessWidget {
  final a = Get.put(app);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '만능앱',
      defaultTransition: Transition.noTransition,
      initialRoute: RouteNames.home,
      getPages: [
        GetPage(name: RouteNames.home, page: () => HomeScreen()),
        GetPage(name: RouteNames.about, page: () => AboutScreen()),
        GetPage(name: RouteNames.register, page: () => RegisterScreen()),
        GetPage(name: RouteNames.login, page: () => LoginScreen()),
        GetPage(name: RouteNames.profile, page: () => ProfileScreen()),
        // GetPage(name: RouteNames.memo, page: () => MemoScreen()),
        // GetPage(name: RouteNames.boni, page: () => BoniScreen()),
        // GetPage(name: RouteNames.gyeony, page: () => GyeonyScreen()),
        // GetPage(name: RouteNames.qrCodeGenerate, page: () => QrCodeGenerateScreen())
      ],
    );
  }
}
