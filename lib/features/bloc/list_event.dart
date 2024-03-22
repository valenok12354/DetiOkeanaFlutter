part of 'list_bloc.dart';

@immutable
abstract class ListEvent {}
class LoadList extends ListEvent {
  final Completer? completer;
  LoadList({this.completer});
}