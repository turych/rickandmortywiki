import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class CharacterSearchEvent extends SearchEvent {
  final String searchQuery;

  CharacterSearchEvent({required this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}