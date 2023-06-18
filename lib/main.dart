import 'package:flutter/material.dart';
// import 'package:project_dkriya/pages/home/cart_page.dart';
// import 'package:project_dkriya/pages/home/homepage.dart';
import 'package:project_dkriya/pages/home/main_home.dart';
// import 'package:project_dkriya/pages/home/settings_page.dart';
import 'package:project_dkriya/pages/splash_screen.dart';
import 'package:project_dkriya/pages/login_screen.dart';
import 'package:project_dkriya/pages/signup_page.dart';
import 'package:project_dkriya/pages/home/profile_page.dart';
import 'package:project_dkriya/provider/auth_provider.dart';
import 'package:project_dkriya/provider/product_provider.dart';
// import 'package:project_dkriya/pages/home/cart_page.dart';
// import 'package:project_dkriya/pages/home/settings_page.dart';
// import 'package:project_dkriya/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=> ProductProvider()..getProducts(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupPage(),
          '/profile': (context) => const ProfilePage(),
          '/home': (context) => const MainHome(),
          // '/settings':(context) => SettingsPage(),
          // '/cart':(context) => ShoppingCartScreen(),
        },
      ),
    );
  }
}
