import 'package:etma2n/shared/component/components.dart';
import 'package:etma2n/todo_list/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Donetask extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var tasks = ToDoCubit.get(context).doneTasks;
    return tasksBuilder(tasks: tasks);
  }
}
