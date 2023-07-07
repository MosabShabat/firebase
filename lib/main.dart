import 'package:firebase/screens/forget_password.dart';
import 'package:firebase/screens/login_screen.dart';
import 'package:firebase/screens/register_screen.dart';
import 'package:firebase/screens/reset_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/auth_getx_controller.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'screens/seplash_screen.dart';

Future<void> main() async {
  Get.put(AuthGetxController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/launch_screen',
        getPages: [
          GetPage(name: '/login_screen', page: () => LoginScreen()),
          GetPage(name: '/forget_screen', page: () => ForgotPasswordScreen()),
          GetPage(name: '/register_screen', page: () => RegisterScreen()),
          GetPage(name: '/launch_screen', page: () => LaunchScreen()),
          GetPage(name: '/home_screen', page: () => HomeScreen()),
        ]);
  } //LaunchScreen
}
