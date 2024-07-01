part of 'splash_page_cubit.dart';

enum SplashStatus {
  loading,
  sucess

}

class SplashPageState extends Equatable {
  const SplashPageState({this.status = SplashStatus.loading});
  final SplashStatus status;
  @override
  List<Object> get props => [status];

  SplashPageState copyWith({
    SplashStatus? status,
  }) {
    return SplashPageState(
      status: status ?? this.status,
    );
  }
}


