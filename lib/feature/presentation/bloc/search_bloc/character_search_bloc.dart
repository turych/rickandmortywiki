import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmortywiki/feature/domain/usecases/search_character.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/map_failure_to_message_mixin.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/search_bloc/character_search_event.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/search_bloc/character_search_state.dart';

@injectable
class CharacterSearchBloc extends Bloc<SearchEvent, SearchState> with MapFailureToMessageMixin {
  final SearchCharacters searchCharacters;

  CharacterSearchBloc({required this.searchCharacters})
      : super(CharacterEmptyState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is CharacterSearchEvent) {
      yield* _mapFetchToState(event.searchQuery);
    }
  }

  Stream<SearchState> _mapFetchToState(String searchQuery) async* {
    yield CharacterEmptyState();

    yield CharacterLoadingState();

    final failOrCharacters =
        await searchCharacters(SearchCharacterParams(name: searchQuery));

    yield failOrCharacters.fold(
        (failure) => CharacterFailureState(message: mapFailureToMessage(failure)),
        (characters) => CharacterLoadedState(characters: characters.results));
  }
}
