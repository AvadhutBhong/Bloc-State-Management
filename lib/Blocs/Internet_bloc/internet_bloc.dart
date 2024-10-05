import 'dart:async';
import 'package:bloc_state_management/Blocs/Internet_bloc/internet_event.dart';
import 'package:bloc_state_management/Blocs/Internet_bloc/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {

  StreamSubscription<List<ConnectivityResult>>? subscription;
  InternetBloc() : super(InternetInitialState()){
      on<InternetLostEvent>((event, emit)=>emit(InternetLostState()));
      on<InternetGainedEvent>((event, emit)=> emit(InternetGainedState()));

      subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
        if(result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi)){
          add(InternetGainedEvent());
        }else{
          add(InternetLostEvent());
        }
      });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}