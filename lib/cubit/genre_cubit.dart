import 'package:bloc/bloc.dart';

class GenreCubit extends Cubit<String> {
  GenreCubit() : super(('All'));

  onSelectGenre(String genre) {
    emit(genre);
  }
}
