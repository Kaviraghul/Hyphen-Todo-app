import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_project/models/task.dart';

class DatabaseService {
  CollectionReference todoCollection =
      FirebaseFirestore.instance.collection("Users");
  final user = Task(title: "modal test ");
  Future createNewTodo(Task newtask) async {
    return await todoCollection.add(newtask.toDocument());
  }

  // Future completeTask(uid) async {
  //   await todoCollection.doc(uid).update({"isCompleted": !taskCompleted});
  // }
}
