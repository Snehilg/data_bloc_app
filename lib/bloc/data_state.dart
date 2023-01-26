import 'package:equatable/equatable.dart';

abstract class DataState extends Equatable {}

class InitialState extends DataState {
  List<Object> get props => [];
}

class DataAdding extends DataState {
  List<Object> get props => [];
}

class DataAdded extends DataState {
  List<Object> get props => [];
}

class ErrorState extends DataState {
  final String error;
  ErrorState(this.error);
  List<Object> get props => [];
}
