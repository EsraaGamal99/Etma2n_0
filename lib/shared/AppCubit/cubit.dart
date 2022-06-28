import 'package:bloc/bloc.dart';
import 'package:etma2n/shared/AppCubit/states.dart';
import 'package:etma2n/shared/network/local/cache_helper.dart';
import 'package:etma2n/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  var TextColor = TextLColor;

  bool isDark = true;
  bool isDoc = false;

  void changeAppMode({bool? fromShared})
  {
    if (fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else
    {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}