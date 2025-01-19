
import 'package:flutter_application_10/app_events.dart';
import 'package:flutter_application_10/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents,AppStates>{
AppBlocs():super(InitStates()){


  on <Increment>((event, serve) {
    

    serve(AppStates(counter: state.counter+1));
    print(state.counter);

  });
  
  on <Decrement>((event, ask) {
    

    ask(AppStates(counter: state.counter-1));
    print(state.counter);

  });
}
}
