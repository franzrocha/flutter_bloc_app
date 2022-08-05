import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_finals/bloc/task%20blocs/task_bloc.dart';
import 'package:flutter_bloc_finals/bloc/task%20blocs/task_state.dart';
import '../widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
               label: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  final pendingTasks = state.pendingTasks!;
                  final completedTasks = state.completedTasks!;
                  return Text(
                    '${pendingTasks.length} Pending | ${completedTasks.length} Completed',
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              final pendingTasks = state.pendingTasks!;
              return TasksList(tasksList: pendingTasks);
            },
          ),
        ],
      ),
    );
  }
}
