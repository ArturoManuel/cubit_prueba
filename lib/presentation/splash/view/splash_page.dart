
import 'package:cubic_prueba/presentation/home/view/homepage.dart';
import 'package:cubic_prueba/presentation/splash/cubit/splash_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../menu/menu_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashPageCubit(),
      child: const SplashView(),
    );
  }
}


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashPageCubit, SplashPageState>(
      listener: (context, state) {
        if(state.status == SplashStatus.sucess){
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => MenuPage())
          );
        }
      },
      child: Scaffold(
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.airplane_ticket, size: 100),
            SizedBox(height: 30),
            CircularProgressIndicator.adaptive(),
          ],
        ),),
      ),
    );
  }
}
