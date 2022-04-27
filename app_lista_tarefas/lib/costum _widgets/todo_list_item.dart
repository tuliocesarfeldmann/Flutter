import 'package:annotation_app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  TodoListItem({Key? key, required this.todo, required this.deleteTodo})
      : super(key: key);

  Todo todo;
  Function(Todo) deleteTodo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Slidable(
        actionPane: const SlidableDrawerActionPane(),
        actions: [
          IconSlideAction(
            icon: Icons.delete,
            color: Colors.red,
            caption: 'Excluir',
            onTap: () {
              deleteTodo(todo);
            },
          )
        ],
        actionExtentRatio: 0.20,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple[100],
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                DateFormat("dd/MM/yyyy - HH:mm").format(todo.dateTime),
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                todo.title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
