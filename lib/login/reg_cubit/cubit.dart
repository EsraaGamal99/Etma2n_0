import 'package:bloc/bloc.dart';
import 'package:etma2n/login/reg_cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
  required String name,
  required String email,
  required String phone,
  required String gender,
  required String password,
}){
    print('Hello');
    emit(RegisterLoadingState()) ;
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: email,
        password: password,
    )
        .then((value) {
        print(value.user!.email) ;
        print(value.user!.uid) ;
      emit(RegisterSuccessState()) ;
    })
      .catchError((error){
      emit(RegisterErrorState(error.toString())) ;
    }) ;
  }

}