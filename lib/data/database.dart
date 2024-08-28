import 'package:hive/hive.dart';

class ToDoDataBase {
  List todolist = [];
  final mybox = Hive.box('mybox');
  // first time ever for app

  void createinitialdata() {
    todolist = [
      ['exersice', false],
      ['work', false]
    ];
  }

  void loaddata() {
    todolist = mybox.get("TODOLIST");
  }

  void updatedb() {
    mybox.put("TODOLIST", todolist);
  }
}
