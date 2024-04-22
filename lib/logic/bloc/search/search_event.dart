part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchEventProperty extends SearchEvent {
  final String name;

  const SearchEventProperty(this.name);

  @override
  List<Object?> get props => [name];
}

class SearchEventLoadMoreProperty extends SearchEvent {
  const SearchEventLoadMoreProperty();
}
