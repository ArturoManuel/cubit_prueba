part of 'pagination_cubit.dart';

enum PaginationStatus {
  initial , loading , loaded , error
  , complete, loadingMoreError
}



class PaginationState extends Equatable {
  /// {@macro pagination}
  const PaginationState({
    this.status = PaginationStatus.initial,
    this.pokeNames = const <Result>[],
  });

  final PaginationStatus status;

  final List<Result> pokeNames;


  @override
  List<Object> get props => [status,pokeNames];

  PaginationState copyWith({
    PaginationStatus? status,
    List<Result>? pokeNames,
  }){
    return PaginationState(
      status: status ?? this.status,
      pokeNames: pokeNames ?? this.pokeNames,
    );}


}

class PaginationInitial extends PaginationState {
  /// {@macro pagination_initial}
  const PaginationInitial() : super();
}
