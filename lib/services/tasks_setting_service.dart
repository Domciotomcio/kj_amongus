import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/data/models/tasksSetting/tasks_setting.dart';

class TasksSettingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<TasksSetting> getTasksSettingStream() {
    return _firestore
        .collection('games')
        .doc('tasks-setting')
        .snapshots()
        .map((snapshot) {
      return TasksSetting.fromJson(snapshot.data()!);
    });
  }

  
}
