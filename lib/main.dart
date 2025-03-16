import 'package:assassinsrewards/screens/login_page.dart';
import 'package:assassinsrewards/screens/reports_list_page.dart';
import 'package:assassinsrewards/screens/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:assassinsrewards/screens/welcome.dart'; // Ensure correct import path
import 'package:assassinsrewards/screens/home_screen.dart'; // Same here for other screens
import 'package:assassinsrewards/screens/create_account_screen.dart';
import 'package:assassinsrewards/screens/describe_case_screen.dart';
import 'package:assassinsrewards/screens/hotspots_map_screen.dart';
import 'package:assassinsrewards/screens/login_police.dart';
import 'package:assassinsrewards/screens/admin_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assassins Rewards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFEB3B),
          primary: const Color(0xFFFFEB3B),
        ),
        useMaterial3: true,
        // other theme customization...
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/welcome': (context) => WelcomePage( ),
        '/wallet_screen': (context) => const WalletScreen(),
        '/home': (context) => const HomeScreen(),
        '/create_account': (context) => const CreateAccountScreen(),
        '/describe_case': (context) => const DescribeCaseScreen(),
        '/hotspots': (context) => const HotspotsMapScreen(),
        '/login_police': (context) => const LoginPolice(),
        '/admin_home': (context) => const AdminHomePage(),
        '/view_reports': (context) => const ReportsListPage(),
        // other routes
      },
    );
  }
}
