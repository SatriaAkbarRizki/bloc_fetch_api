import 'package:bloc_fetch_api/bloc/bloc_game_bloc.dart';
import 'package:bloc_fetch_api/cubit/genre_cubit.dart';
import 'package:bloc_fetch_api/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlocGame(),
        ),
        BlocProvider(
          create: (context) => GenreCubit(),
        )
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
