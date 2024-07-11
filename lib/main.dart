import 'package:bloc/bloc.dart';
import 'package:cubic_prueba/domain/poke_repository.dart';
import 'package:cubic_prueba/presentation/home/cubit/counter_cubit.dart';
import 'package:cubic_prueba/presentation/home/view/homepage.dart';
import 'package:cubic_prueba/presentation/splash/view/splash_page.dart';
import 'package:cubic_prueba/theme.dart';
import 'package:cubic_prueba/util.dart';
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

    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);
    return RepositoryProvider(
      create: (context) => PokeRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:  brightness == Brightness.light ? theme.light() : theme.dark(),
        home: const SplashPage(),
      ),
    );
  }
}

// BlocProvider(create: (_) => CounterCubit()..getfechGetData(),
// child: const MyHomePage(title: 'Flutter Demo Home Page')),
// );
