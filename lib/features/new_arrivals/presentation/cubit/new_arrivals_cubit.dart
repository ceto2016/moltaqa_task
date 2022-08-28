import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/new_arrivals.dart';

import '../../domain/usecases/get_new_arrivals.dart';

part 'new_arrivals_state.dart';

class NewArrivalsCubit extends Cubit<NewArrivalsState> {
  final GetNewArrivals getNewArrivals;
  NewArrivalsCubit({required this.getNewArrivals})
      : super(NewArrivalsInitial());
  int nextPage = 1;
  bool isMore = false;
  List<NewArrival> newArrivals = [];
  Future<void> fGetNewArrivals() async {
    if (isGetArrivals()) {
      emitLoadingState(nextPage);
      final failOrResponse =
          await getNewArrivals(GetNewArrivalsParams(pageNumber: nextPage));
      failOrResponse.fold((fail) {
        emit(NewArrivalsError());
      }, (newResponse) {
        nextPage += 1;
        isMore = newResponse.data.checkIfMore();
        newArrivals += newResponse.data.newArrivals;
        emit(NewArrivalsHasData());
      });
    }
  }

  void emitLoadingState(int pageNumber) {
    pageNumber > 1
        ? emit(NewArrivalsLoadingMore())
        : emit(NewArrivalsLoading());
  }

  bool isGetArrivals() {
    return nextPage == 1 || isMore;
  }
}
