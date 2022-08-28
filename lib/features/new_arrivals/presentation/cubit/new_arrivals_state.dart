part of 'new_arrivals_cubit.dart';

abstract class NewArrivalsState extends Equatable {
  const NewArrivalsState();

  @override
  List<Object> get props => [];
}

class NewArrivalsInitial extends NewArrivalsState {}

class NewArrivalsLoading extends NewArrivalsState {}

class NewArrivalsLoadingMore extends NewArrivalsState {}

class NewArrivalsHasData extends NewArrivalsState {}

class NewArrivalsError extends NewArrivalsState {}
