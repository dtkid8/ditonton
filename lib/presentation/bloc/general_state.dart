import 'package:equatable/equatable.dart';

abstract class GeneralState extends Equatable {
  const GeneralState();

  @override
  List<Object> get props => [];
}

class GeneralInitializeState extends GeneralState {}

class GeneralLoadingState extends GeneralState {}

class GeneralErrorState extends GeneralState {
  final String message;

  GeneralErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class GeneralLoadedState<T> extends GeneralState{
  final T data;
  GeneralLoadedState(this.data);

  @override
  List<Object> get props => [data as Object];
}
