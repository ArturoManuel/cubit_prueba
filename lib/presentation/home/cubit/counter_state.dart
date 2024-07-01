import 'package:cubic_prueba/data/models/pokemon_model.dart';
import 'package:equatable/equatable.dart';

// enum CounterStatus{
//   initial,
//   loading,
//   success,
//   error
// }
// class HomeState implements Equatable{
//   final int counter;
//   final CounterStatus status;
//   final Pokemon? pokemon;
//
//   const HomeState({
//     this.counter =0,
//     this.status = CounterStatus.initial,
//     this.pokemon,
//   });
//   // nueva instancia de esta clase
//   @override
//   List<Object?> get props => [counter,status,pokemon];
//   @override
//   bool? get stringify => true;
//
//   // se debe agregar esto para que se vea los estados con detalle
//   @override
//   String toString() => 'CounterState(counter: $counter, status: $status)';
//
//   HomeState copyWith({
//     int? counter,
//     CounterStatus? status,
//     Pokemon? pokemon,
//   }) {
//     return HomeState(
//       counter: counter ?? this.counter,
//       status: status ?? this.status,
//       pokemon: pokemon ?? this.pokemon,
//     );
//   }
// }

class HomeState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];



}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final Pokemon pokemon ;
  HomeSuccess (this.pokemon);
  @override
  List<Object?> get props => [pokemon];
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);

  @override
  List<Object?> get props => [message];


}