import 'package:conditional_builder/conditional_builder.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:etma2n/todo_list/cubit/cubit.dart';
import 'package:etma2n/todo_list/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoCubit, ToDostates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = ToDoCubit.get(context).newTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
