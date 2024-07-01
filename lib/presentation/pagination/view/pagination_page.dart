import 'package:cubic_prueba/domain/poke_repository.dart';
import 'package:flutter/material.dart';
import 'package:cubic_prueba/presentation/pagination/cubit/cubit.dart';
import 'package:cubic_prueba/presentation/pagination/widgets/pagination_body.dart';

/// {@template pagination_page}
/// A description for PaginationPage
/// {@endtemplate}
class PaginationPage extends StatelessWidget {
  /// {@macro pagination_page}
  const PaginationPage({super.key});

  /// The static route for PaginationPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PaginationPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaginationCubit(pokeRepository: context.read<PokeRepository>())..getPokemonName(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pagination"),
        ),
        body: PaginationView(),
      ),
    );
  }    
}

/// {@template pagination_view}
/// Displays the Body of PaginationView
/// {@endtemplate}
class PaginationView extends StatelessWidget {
  /// {@macro pagination_view}
  const PaginationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaginationBody();
  }
}
