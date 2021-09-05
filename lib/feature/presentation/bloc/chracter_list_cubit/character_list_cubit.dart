import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_entity.dart';
import 'package:rickandmortywiki/feature/domain/usecases/get_all_charchers.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/map_failure_to_message_mixin.dart';

import 'character_list_state.dart';

@injectable
class CharacterListCubit extends Cubit<CharacterListState>
    with MapFailureToMessageMixin {
  final GetAllCharacters getAllCharacters;

  int page = 1;

  CharacterListCubit({required this.getAllCharacters})
      : super(CharacterListEmptyState());

  void loadCharacters() async {
    if (state is CharacterListLoadingState) return;

    var currentState = state;
    var oldCharacters = <CharacterEntity>[];
    if (currentState is CharacterListLoadedState) {
      oldCharacters = currentState.characters;
    }

    emit(CharacterListLoadingState(oldCharacters, isFirstFetch: page == 1));

    final failOrCharacters =
        await getAllCharacters(PageCharacterParams(page: page));
    failOrCharacters.fold(
        (failure) =>
            emit(CharacterListErrorState(message: mapFailureToMessage(failure))),
        (newCharacters) {
      page++;
      final characters = (state as CharacterListLoadingState).oldCharacters;
      characters.addAll(newCharacters.results);
      emit(CharacterListLoadedState(characters: characters));
    });
  }
}
