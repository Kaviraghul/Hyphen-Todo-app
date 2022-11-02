import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_project/models/task.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          return !snapshot.hasData
              ? const Center(child: Text('Please Wait'))
              : Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot task = snapshot.data.docs[index];
                        return Dismissible(
                          background: Container(
                            color: Colors.red,
                            child: const Center(
                              child: Text(
                                'Delete this task',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          key: ValueKey(task.id),
                          onDismissed: (direction) async {
                            await FirebaseFirestore.instance
                                .collection("Users")
                                .doc(task.id)
                                .delete();
                          },
                          child: ListTile(
                            title: Text(task['title']),
                            trailing: Checkbox(
                                value: task['done'],
                                onChanged: (value) async {
                                  final doneStatus = task['done'];
                                  await FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(task.id)
                                      .update({'done': !doneStatus});
                                }),
                          ),
                        );
                      }),
                );
        });
  }
}
