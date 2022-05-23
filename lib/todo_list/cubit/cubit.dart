import 'package:bloc/bloc.dart';
import 'package:etma2n/todo_list/archivedtasks/archivedtask.dart';
import 'package:etma2n/todo_list/donetask/donetask.dart';
import 'package:etma2n/todo_list/newtask/newtask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'states.dart';

class ToDoCubit extends Cubit<ToDostates> {
  ToDoCubit() : super(ToDoInitialState());

  static ToDoCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<Widget> screens = [
    NewTask(),
    Donetask(),
    ArchivedTask(),
  ];
  List<String> title = [
    'المهام',
    'تم',
    'الارشيف',
  ];
  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
  bool isBottomSheetShow = false;

  IconData fab = Icons.edit;

  void changeIndex(int index) {
    currentindex = index;
    emit(ToDochangeBottomNavBarState());
  }

  //create DB in local
  void creatdb() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('DataBase created');
        database
            .execute(
                'create TABLE tasks(id INTEGER PRIMARY KEY,title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('Table created');
        }).catchError((error) {
          print('Error when created table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getdb(database);
        print('DataBase Opened');
      },
    ).then((value) {
      database = value;
      emit(ToDoCreateDB());
    });
  }

  int? id;

  //insert  in local DB
  insertdb({
    required String title,
    required String time,
    required String date,
  }) async {
    await database!.transaction((txn) async {
      id = await txn
          .rawInsert(
              'INSERT INTO tasks ( title,date,time,status) VALUES ("$title","$date","$time","new")')
          .then((value) {
        print('$value INSERT successfully');
        emit(ToDoInsertDB());
        getdb(database);
      }).catchError((error) {
        print('Error when Inserting NEw record ${error.toString()}');
      });
      return null;
    });
  }

  //get from local DB
  void getdb(database) {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];

    emit(ToDoGetDBloadingstate());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else if (element['status'] == 'archive') archiveTasks.add(element);
      });
      emit(ToDoGetDB());
    });
  }

  void changeBottomsheet({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShow = isShow;
    fab = icon;
    emit(ToDochangeBottomSheetState());
  }

  //update  local DB
  void updateDB({
    required String status,
    required int id,
  }) async {
    database!.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value) {
      getdb(database);
      emit(ToDoUpdateDB());
    });
  }

  //delete from local DB
  void deletDB({
    required int id,
  }) async {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getdb(database);
      emit(ToDoDeleteDB());
    });
  }
}
