// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc_game_bloc.dart';

@immutable
sealed class BlocGameEvent {}

class OnFetchDataGame extends BlocGameEvent {}

class OnSavedBookmark extends BlocGameEvent {
  final GameModel game;
  OnSavedBookmark({
    required this.game,
  });
}

class OnUnSavedBookmark extends BlocGameEvent {
  final GameModel game;
  OnUnSavedBookmark({
    required this.game,
  });
}
