import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubic_prueba/domain/poke_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/poke_result_model.dart';
part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit({required PokeRepository pokeRepository}) : _pokeRepository =pokeRepository,super(const PaginationInitial());
  final PokeRepository _pokeRepository ;

  /// A description for yourCustomFunction 
  FutureOr<void> getPokemonName() async {
    if(state.status == PaginationStatus.complete){
      return;
    }
    print("se llamo a getPokeName");
    print("${state.pokeNames.length}");
    if(state.status == PaginationStatus.loading) return;
    if(state.status != PaginationStatus.initial) {
      emit(state.copyWith(status:PaginationStatus.loading));
    }

    try{
      emit(state.copyWith(status: PaginationStatus.loading));
      final pokeResult = await _pokeRepository.getPokemonList(offset: state.pokeNames.length);
      if(pokeResult.results.isEmpty){
        emit(state.copyWith(status: PaginationStatus.complete));
        return;
      }

      emit(state.copyWith(
        status: PaginationStatus.loaded,
        pokeNames: [...state.pokeNames,...pokeResult.results],
      ));
    }catch (e){
      if(state.status == PaginationStatus.loading){
        emit(state.copyWith(status: PaginationStatus.loadingMoreError));
      }
      emit(state.copyWith(status: PaginationStatus.error));
    }
  }
}
