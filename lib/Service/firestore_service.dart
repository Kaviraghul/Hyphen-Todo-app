import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_project/View/Tasks/CurrentTasks/task_model.dart';

class DatabaseService {
  CollectionReference todoCollection =
      FirebaseFirestore.instance.collection("Users");
  final user = Task(title: "modal test ");
  Future createNewTodo(Task newtask) async {
    return await todoCollection.add(newtask.toDocument());
  }
}
