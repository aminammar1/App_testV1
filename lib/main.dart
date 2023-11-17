import 'package:app_test/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'openscreen.dart';
import 'login_screen.dart';
import 'create_account.dart';
import 'product_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    initialRoute: '/', // Set the initial route
    routes: {
      '/': (context) => OpeningScreen(), // Define the route for OpeningScreen
      '/login': (context) => LoginScreen(), // Define the route for LoginScreen
      '/signup': (context) =>
          CreateAccountScreen(), // Route for CreateAccountScreen
      '/products': (context) =>
          ProductScreen(), // Route for ProductScreen if authenticated
      // You can add more routes for navigation if needed
    },
  ));
}
