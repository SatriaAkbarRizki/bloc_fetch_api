import 'package:bloc_fetch_api/cubit/genre_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListGenre extends StatelessWidget {
  final List<String> genre = [
    'All',
    'Shooter',
    'MMOARPG',
    'ARPG',
    'Strategy',
    'Fighting',
  ];
  ListGenre({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: genre
            .map((genre) => GestureDetector(
                  onTap: () => context.read<GenreCubit>().onSelectGenre(genre),
                  child: BlocBuilder<GenreCubit, String>(
                    builder: (context, genreState) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          color: genre == genreState
                              ? const Color.fromARGB(255, 77, 207, 81)
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(genre,
                          style: TextStyle(
                              color: genre == genreState
                                  ? Colors.white
                                  : Colors.black)),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
