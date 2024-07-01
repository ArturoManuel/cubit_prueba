import 'package:bloc/bloc.dart';
import 'package:cubic_prueba/domain/poke_repository.dart';
import 'package:cubic_prueba/presentation/home/cubit/counter_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required PokeRepository pokerepository}) : _pokeRepository=pokerepository ,super(HomeLoading());
  final PokeRepository _pokeRepository;



  Future<void> getfechGetData() async{
    try{
      emit(HomeLoading());
      final pokemon = await _pokeRepository.getPokemon();
      emit(HomeSuccess(pokemon));

    }catch (e){
        emit(HomeError(e.toString()));
    }
  }

}