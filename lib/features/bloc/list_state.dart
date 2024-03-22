part of 'list_bloc.dart';

@immutable
abstract class ListState extends Equatable {}

class ListInitial extends ListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ListLoading extends ListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ListLoaded extends ListState {
  final List<CryptoCoin> coinsList;
  ListLoaded({required this.coinsList});

  @override
  // TODO: implement props
  List<Object?> get props => [coinsList];
}
class ListLoadingFailure extends ListState {
  final Object exception;

  ListLoadingFailure({required this.exception});

  @override
  // TODO: implement props
  List<Object?> get props => [exception];
}