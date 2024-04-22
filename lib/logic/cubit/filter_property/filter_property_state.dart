part of 'filter_property_cubit.dart';

abstract class FilterPropertyState extends Equatable {
  const FilterPropertyState();

  @override
  List<Object> get props => [];
}

class FilterPropertyInitial extends FilterPropertyState {
  const FilterPropertyInitial();
}

class FilterPropertyLoading extends FilterPropertyState {}

class FilterPropertyLoadMorePage extends FilterPropertyState {}

class FilterPropertyLoaded extends FilterPropertyState {
  final FilterPropertyListModel property;

  const FilterPropertyLoaded(this.property);

  @override
  List<Object> get props => [property];
}

class FilterPropertyFilteredLoaded extends FilterPropertyState {
  final FilterPropertyListModel property;

  const FilterPropertyFilteredLoaded(this.property);

  @override
  List<Object> get props => [property];
}

class FilterPropertyError extends FilterPropertyState {
  final String message;
  final int statusCode;

  const FilterPropertyError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class FilterStateClear extends FilterPropertyState {
  final String message;

  const FilterStateClear(this.message);

  @override
  List<Object> get props => [message];
}
