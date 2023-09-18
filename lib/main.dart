import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_web_app/screens/category_screen/category_screen.dart';
import 'package:news_web_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:news_web_app/screens/login_screen/login_screen.dart';

import 'demo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBN99PGFY_ljd3I0tWezTP866UEQLtn7LY",
            appId: "1:700407648138:web:bed5eb5ff00d4b38318273",
            messagingSenderId: "700407648138",
            projectId: "news-app-8a54c"));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashBoardScreen(),
    );
  }
}
