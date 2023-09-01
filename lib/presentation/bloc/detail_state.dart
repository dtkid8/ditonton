import 'package:equatable/equatable.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitializeState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailErrorState extends DetailState {
  final String message;

  DetailErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class DetailLoadedState<T> extends DetailState {
  final T data;
  DetailLoadedState(this.data);

  @override
  List<Object> get props => [data as Object];
}

class DetailWatchlistState extends DetailState {
  final String message;
  DetailWatchlistState(this.message);

  @override
  List<Object> get props => [message];
}
