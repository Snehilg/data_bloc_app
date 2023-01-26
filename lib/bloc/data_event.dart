import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Create extends DataEvent {
  final String name;
  final String price;

  Create(this.name, this.price);
}
