import 'package:data_bloc_app/bloc/data_event.dart';
import 'package:data_bloc_app/bloc/data_state.dart';
import 'package:data_bloc_app/repo/data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepository;
  DataBloc({required this.dataRepository}) : super(InitialState()) {
    on<Create>((event, state) async {
      emit(DataAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await dataRepository.create(name: event.name, price: event.price);
        emit(DataAdded());
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
