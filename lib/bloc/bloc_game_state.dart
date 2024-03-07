part of 'bloc_game_bloc.dart';

@immutable
sealed class GameState {}

final class GameInitial extends GameState {}

final class GameLoading extends GameState {}

final class GameLoaded extends GameState {
  final List<GameModel> listGame;

  GameLoaded(this.listGame);
}

final class GameFailure extends GameState {
  final String message;

  GameFailure(this.message);
}
