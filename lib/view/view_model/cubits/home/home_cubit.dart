import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context)=>BlocProvider.of<HomeCubit>(context);
  int currentIndex = 0;
  Future<void> navBar(index)async{
    currentIndex = index;
    emit(PageChanged());

  }
}
