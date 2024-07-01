import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_page_state.dart';

class SplashPageCubit extends Cubit<SplashPageState> {
  SplashPageCubit() : super( const SplashPageState() ){
    _init();
  }
  
  void _init (){
    Future.delayed(const Duration(seconds: 3),(){
      emit(state.copyWith(status: SplashStatus.sucess));
    });
    
  }
  
}
