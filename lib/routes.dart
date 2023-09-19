import 'package:longboardapp/home/home.dart';
import 'package:longboardapp/login/login.dart';
import 'package:longboardapp/profile/profile.dart';
import 'package:longboardapp/styles/styles.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/styles': (context) => const StyleScreen(),
};
