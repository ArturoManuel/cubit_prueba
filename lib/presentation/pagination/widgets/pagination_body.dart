import 'package:flutter/material.dart';
import 'package:cubic_prueba/presentation/pagination/cubit/cubit.dart';

/// {@template pagination_body}
/// Body of the PaginationPage.
///
/// Add what it does
/// {@endtemplate}
class PaginationBody extends StatefulWidget {
  /// {@macro pagination_body}
  const PaginationBody({super.key});

  @override
  State<PaginationBody> createState() => _PaginationBodyState();
}

class _PaginationBodyState extends State<PaginationBody> {

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController() ;
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double delta = MediaQuery.of(context).size.height * 0.2; // 20% of the screen height

    if (maxScroll - currentScroll <= delta) {
      context.read<PaginationCubit>().getPokemonName();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationCubit, PaginationState>(
      buildWhen: (previus,current){
        return current.status !=PaginationStatus.loading || current.status!= PaginationStatus.loadingMoreError;
      },
      builder: (context, state) {
        switch(state.status){
          case PaginationStatus.initial:
            return const Center(child: CircularProgressIndicator(),);

          case PaginationStatus.loaded:
            return ListView.builder(
                controller: _scrollController,
                itemCount: state.pokeNames.length,
                itemBuilder: (context,index){
                  final pokeName = state.pokeNames[index];
                  return ListTile(
                    title: Text("$index ${pokeName.name}"),
                  );
                }
            );
          default :
          return const Center(child: Text("Error"),);
        }
      },
    );
  }
}
