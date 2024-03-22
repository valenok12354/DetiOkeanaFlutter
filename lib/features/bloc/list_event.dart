part of 'list_bloc.dart';

@immutable
abstract class ListEvent extends Equatable {}
class LoadList extends ListEvent {
  final Completer? completer;
  LoadList({this.completer});

  @override
  // TODO: implement props
  List<Object?> get props => [completer];
}