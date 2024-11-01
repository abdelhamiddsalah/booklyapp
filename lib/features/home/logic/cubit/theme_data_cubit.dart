import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/helper/enums.dart';
import 'package:booklyapp/core/helper/sharedPrefernces_helper.dart';
import 'package:meta/meta.dart';

part 'theme_data_state.dart';

class ThemeDataCubit extends Cubit<ThemeDataState> {
  ThemeDataCubit() : super(ThemeDataInitial()) {
    final theme = SharedPrefHelper.getString('theme');
    if (theme == 'l') {
      emit(ThemeDataLight());
    } else if (theme == 'd') {
      emit(ThemeDataDark());
    } else {
      emit(ThemeDataInitial());
    }
  }

  void toggleTheme(ThemeStates state) {
    if (state == ThemeStates.light) {
      SharedPrefHelper.setData('theme', 'l');
      emit(ThemeDataLight());
    } else if (state == ThemeStates.dark) {
      SharedPrefHelper.setData('theme', 'd');
      emit(ThemeDataDark());
    }
  }
}
