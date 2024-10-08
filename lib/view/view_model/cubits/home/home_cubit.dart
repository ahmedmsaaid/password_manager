import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  int currentIndex = 0;
  bool darkMood = false;

  String dropdownValue = 'en';
  Future<void> navBar(index) async {
    currentIndex = index;
    emit(PageChanged());
  }

  void darkMoode() {
    darkMood = !darkMood;

    emit(DarkMoodOn());
  }

  void changeLang(String selectedValue) {
    {
      dropdownValue = selectedValue;
      emit(DrobDown());
    }
  }
}
