import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'home.dart';

void main() async {
  //var devices = [235FE00939F3FB747CD6EA75F2117A27];
  var devices = ["235FE00939F3FB747CD6EA75F2117A27"];
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  RequestConfiguration request =
      RequestConfiguration(testDeviceIds:<String>["235FE00939F3FB747CD6EA75F2117A27"]);
  MobileAds.instance.updateRequestConfiguration(request);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
