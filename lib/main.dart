import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'comman /get_stroge.dart';
import 'local/db.dart';
import 'modules/splash/spalsh_screen.dart';
import 'network/api_client.dart';
import 'network/api_urls.dart';

Future<void> main() async {
  await ApiClient.init(ApiUrl.baseUrl);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Db();
    AppPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
