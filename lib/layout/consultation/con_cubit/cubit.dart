import 'package:bloc/bloc.dart';
import 'package:etma2n/layout/consultation/con_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsCubit extends Cubit<ConsStates> {
  ConsCubit() : super(ConsInitialState());

  static ConsCubit get(context) => BlocProvider.of(context);
  String selectedDoctor = "اختار الدكتور";
 // void doctorSelected

}
