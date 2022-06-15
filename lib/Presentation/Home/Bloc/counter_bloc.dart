import 'package:bloc/bloc.dart';
import 'package:bloc_assign/Data/apiService.dart';
import 'package:bloc_assign/Data/local.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../locator.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(LocalStorageService().readCounter())) {
  final api = locator<ApiServices>();
  final local = locator<LocalStorageService>();
    on<IncrementStarted>((event, emit) async =>{

      local.save(state.count+1),
       await api.getBinary(state.count+1),
       local.saveBin(ApiServices.binary),
        emit( CounterComplete(state.count+1)),
    },
    );
    on<DecrementStarted>((event, emit) async => {
      local.save(state.count-1),
      await api.getBinary(state.count-1),
      local.saveBin(ApiServices.binary),
      emit( CounterComplete(state.count-1)),

    });
  }






}
