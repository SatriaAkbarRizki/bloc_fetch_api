import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import '../bloc/bloc_game_bloc.dart';
import '../models/game.dart';

class GameGrid extends StatelessWidget {
  const GameGrid({
    super.key,
    required this.games,
  });

  final GameModel games;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: games.thumbnail,
          fit: BoxFit.fill,
        )),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Colors.black, Colors.transparent])),
          alignment: Alignment.bottomLeft,
          child: Text(games.title, style: const TextStyle(color: Colors.white)),
        ),
        Positioned(
            top: 5,
            right: 5,
            child: IconButton(
                onPressed: () {
                  if (games.isSaved) {
                    context
                        .read<BlocGame>()
                        .add(OnUnSavedBookmark(game: games));
                  } else {
                    context.read<BlocGame>().add(OnSavedBookmark(game: games));
                  }
                },
                icon: games.isSaved
                    ? const Icon(
                        Icons.bookmark,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      )))
      ],
    );
  }
}
