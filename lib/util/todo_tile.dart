import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.taskname,
      required this.takscompleted,
      required this.onchanged,
      required this.deletefunction});
  final String taskname;
  final bool takscompleted;
  final void Function(bool?)? onchanged;
  final Function(BuildContext)? deletefunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 35),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deletefunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 130, 146, 192),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(value: takscompleted, onChanged: onchanged),
              Text(
                taskname,
                style: TextStyle(
                    decoration: takscompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
