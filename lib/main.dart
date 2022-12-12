import 'package:fitness/home/home_screen.dart';
import 'package:fitness/screens/dashboard/dashboard_screen.dart';
import 'package:fitness/screens/login/LoginScreen.dart';
import 'package:fitness/screens/onboarding/onboarding_screen.dart';
import 'package:fitness/services/DashboardService.dart';
import 'package:fitness/services/LoginService.dart';
import 'package:fitness/services/MembershipService.dart';
import 'package:fitness/services/MerchantService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginService(),
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardService(),
        ),
        ChangeNotifierProvider(
          create: (_) => MembershipService(),
        ),
        ChangeNotifierProvider(
          create: (_) => MerchantService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
