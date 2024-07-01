import 'package:cubic_prueba/domain/poke_repository.dart';
import 'package:cubic_prueba/presentation/home/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../widgets/custom_alert.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
        HomeCubit(pokerepository: context.read<PokeRepository>())
          ..getfechGetData(),
        child: const MyHomeView()
    );
  }
}


class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});


  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("Block Cubit"),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          if (state is HomeSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Pokemon Dito',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  ...state.pokemon.abilities.map((ability) =>
                      Text(ability.ability.name)).toList()
                ],
              ),
            );
          }
          if (state is HomeError) {
            return Center(child: Text("Error"),);
          }

          return SizedBox();
        },
      ), //// This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (builder) {
          return BlocProvider.value(
            value: context.read<HomeCubit>(),
            child: CustomAlert(),
          );
        });
      },
        child: Icon(Icons.refresh),),
    );
  }
}


