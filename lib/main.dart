// Import necessary packages
import 'package:api_demo/core/di/injection_container.dart';
import 'package:api_demo/core/routes/app_router.dart';
import 'package:api_demo/features/posts/presentation/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Main entry point of the application
/// This function initializes all necessary services and dependencies
void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase services
  await Firebase.initializeApp();
  
  // Initialize GetIt dependency injection
  await initDependencies();
  
  // Configure Firebase Crashlytics to catch all Flutter errors
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  
  // Run the app wrapped in ProviderScope for Riverpod state management
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/// Root widget of the application
/// Uses ConsumerWidget from Riverpod for state management
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'API Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // HomePage is the initial route of the application
      home: const HomePage(),
    );
  }
}


