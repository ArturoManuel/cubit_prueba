import 'package:bloc/bloc.dart';
import 'package:cubic_prueba/domain/poke_repository.dart';
import 'package:cubic_prueba/presentation/home/cubit/counter_cubit.dart';
import 'package:cubic_prueba/presentation/home/view/homepage.dart';
import 'package:cubic_prueba/presentation/splash/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PokeRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplashPage(),
      ),
    );
  }
}

// BlocProvider(create: (_) => CounterCubit()..getfechGetData(),
// child: const MyHomePage(title: 'Flutter Demo Home Page')),
// );
