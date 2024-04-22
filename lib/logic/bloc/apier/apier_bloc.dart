import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'apier_event.dart';
part 'apier_state.dart';

class ApierBloc extends Bloc<ApierEvent, ApierState> {
  ApierBloc() : super(ApierInitial()) {
    on<ApierEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
