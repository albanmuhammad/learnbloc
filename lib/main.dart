import 'package:blocapplication/firebase_options.dart';
import 'package:blocapplication/injection_contaier.dart';
import 'package:blocapplication/presentation/bloc/car_bloc.dart';
import 'package:blocapplication/presentation/bloc/car_event.dart';
import 'package:blocapplication/presentation/pages/car_details_page.dart';
import 'package:blocapplication/presentation/pages/car_list_screen.dart';
import 'package:blocapplication/presentation/pages/map_details_page.dart';
import 'package:blocapplication/presentation/pages/onboarding_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: OnboardingPage(),
      ),
    );
  }
}
