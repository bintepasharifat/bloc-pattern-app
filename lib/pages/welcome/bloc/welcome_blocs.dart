import 'package:flutter_application_10/pages/welcome/bloc/welcome_events.dart';
import 'package:flutter_application_10/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBlocs extends Bloc<WelcomeEvents, WelcomeStates> {
  WelcomeBlocs() : super(WelcomeStates()) {
    on<WelcomeEvents>(
      (event, emit) {
        emit(WelcomeStates(page: state.page));
      },
    );
  }
}
