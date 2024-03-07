import 'dart:developer';

import 'package:bloc_fetch_api/models/game.dart';
import 'package:bloc_fetch_api/sources/game_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_game_event.dart';
part 'bloc_game_state.dart';

class BlocGame extends Bloc<BlocGameEvent, GameState> {
  final GameSource _gameSource = GameSource();

  BlocGame() : super(GameInitial()) {
    on<OnFetchDataGame>((event, emit) async {
      emit(GameLoading());
      await _gameSource.fetchGameApi().then((result) {
        if (result == null) {
          emit(GameFailure('Data not found or Something went wrong'));
        } else {
          emit(GameLoaded(result));
        }
      });
    });

    on<OnSavedBookmark>((event, emit) {
      final games = (state as GameLoaded).listGame;
      GameModel newGame = event.game.copyWith(isSaved: true);
      int index = games.indexWhere((element) => element.id == newGame.id);
      games[index] = newGame;
      emit(GameLoaded(games));
    });
    on<OnUnSavedBookmark>((event, emit) {
      final games = (state as GameLoaded).listGame;
      GameModel newGame = event.game.copyWith(isSaved: false);
      int index = games.indexWhere((element) => element.id == newGame.id);
      games[index] = newGame;
      emit(GameLoaded(games));
    });
  }
}
