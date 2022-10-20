import 'package:firebase_auth_project/Widgets/tasks_list.dart';
import 'package:firebase_auth_project/blocs/bloc_exports.dart';
import 'package:firebase_auth_project/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:lottie/lottie.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  void _addNewTask() {}
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          body: SizedBox(
            child: Column(children: [
              Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: Lottie.network(
                    'https://assets8.lottiefiles.com/packages/lf20_z4cshyhf.json',
                    height: 300),
              ),
              const Divider(
                height: 0.2,
                color: Color(0xFF18c8c1),
              ),
              TaskList(taskList: tasksList)
            ]),
          ),
          bottomNavigationBar: BottomNavigationBar(
              elevation: 2,
              onTap: (value) => {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text(
                                        'Add new task',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 20),
                                      TextField(
                                        controller: titleController,
                                        autofocus: true,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        decoration: const InputDecoration(
                                          enabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5))),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFFff7b7b),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5))),
                                                child: const Text(
                                                  'Add task',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                onPressed: () {
                                                  var task = Task(
                                                      title:
                                                          titleController.text);
                                                  context
                                                      .read<TasksBloc>()
                                                      .add(AddTask(task: task));
                                                  Navigator.pop(context);
                                                }),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.pen),
                  label: 'New task',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Completed tasks',
                )
              ]),
        );
      },
    );
  }
}
