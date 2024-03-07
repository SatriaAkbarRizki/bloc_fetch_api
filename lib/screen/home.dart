import 'package:bloc_fetch_api/bloc/bloc_game_bloc.dart';
import 'package:bloc_fetch_api/cubit/genre_cubit.dart';
import 'package:bloc_fetch_api/models/game.dart';
import 'package:bloc_fetch_api/widget/listgenre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widget/gamegrid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<BlocGame>().add(OnFetchDataGame());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Free'),
      ),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10), child: ListGenre()),
          Expanded(
            child: BlocBuilder<BlocGame, GameState>(
              builder: (context, state) {
                if (state is GameLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GameFailure) {
                  return Text(state.message);
                } else if (state is GameLoaded) {
                  return BlocBuilder<GenreCubit, String>(
                    builder: (context, genreState) {
                      List<GameModel> categoryGame;
                      if (genreState == 'All') {
                        categoryGame = state.listGame;
                      } else {
                        categoryGame = state.listGame
                            .where((element) => element.genre == genreState)
                            .toList();
                      }
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        padding: const EdgeInsets.all(5),
                        itemCount: categoryGame.length,
                        itemBuilder: (context, index) {
                          GameModel games = categoryGame[index];
                          return GameGrid(
                            games: games,
                          );
                        },
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
