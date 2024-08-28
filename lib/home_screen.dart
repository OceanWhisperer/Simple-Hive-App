import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simpletodoapp/data/database.dart';
import 'package:simpletodoapp/util/dialogbox.dart';
import 'package:simpletodoapp/util/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mybox = Hive.box('mybox');
  final controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    if (mybox.get("TODOLIST") == null) {
      db.createinitialdata();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updatedb();
  }

  void savenewtask() {
    setState(() {
      db.todolist.add([controller.text, false]);
      controller.clear();
      Navigator.of(context).pop();
    });
  }

  void deletetask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updatedb();
  }

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) => DialogboxMade(
        controller: controller,
        onsave: savenewtask,
        oncancel: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Tasks List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 130, 146, 192),
        onPressed: createnewtask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, indx) {
          return TodoTile(
              taskname: db.todolist[indx][0],
              deletefunction: (context) => deletetask(indx),
              takscompleted: db.todolist[indx][1],
              onchanged: (value) => checkboxchanged(value, indx));
        },
      ),
    );
  }
}
