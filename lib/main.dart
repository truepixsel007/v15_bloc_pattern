import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:v15_bloc_pattern/repository/auth/login_mock_api_repository.dart';
import 'package:v15_bloc_pattern/repository/auth/login_repository.dart';
import 'package:v15_bloc_pattern/repository/movies/movies_http_api_repository.dart';
import 'package:v15_bloc_pattern/repository/movies/movies_repository.dart';

import 'config/routes/routes.dart';
import 'config/routes/routes_name.dart';

// you also lean decopaling and copaling
GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviceLocator() {
  // getIt.registerLazySingleton<LoginRepository>(() => LoginRepository());

  // getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());

  getIt.registerLazySingleton<LoginRepository>(() => LoginMockApiRepository());

  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesHttpApiRepository(),
  );
}

// dart run build_runner watch -d

// flutter packages pub run build_runner build

// dart run build_runner build

// flutter clean
// flutter pub get
// dart run build_runner clean
// dart run build_runner build --delete-conflicting-outputs
