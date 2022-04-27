import 'package:annotation_app/models/todo.dart';
import 'package:annotation_app/repositories/todo_repository.dart';
import 'package:flutter/material.dart';
import '../costum _widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController todoControler = TextEditingController();
  TodoRepository todoRepository = TodoRepository();

  List<Todo> todos = [];
  Todo? deletedTodo;
  int? deletedTodoIndex;

  String? errorText;

  @override
  void initState() {
    super.initState();

    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "LISTA DE TAREFAS",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.purple),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: todoControler,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Digite sua tarefa",
                        labelStyle: const TextStyle(color: Colors.purple),
                        hintText: "Ex..: Academia às 20:00h",
                        errorText: errorText,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      if (todoControler.text.isEmpty) {
                        setState(() {
                          errorText =
                              'O titulo de uma tarefa não pode ser vazio!';
                        });
                        return;
                      }

                      setState(() {
                        todos.add(
                          Todo(
                            title: todoControler.text,
                            dateTime: DateTime.now(),
                          ),
                        );
                        errorText = null;
                      });
                      todoControler.clear();
                      todoRepository.saveTodoList(todos);
                    },
                    child: const Icon(Icons.add),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(20),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(
                            color: Colors.purple,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (int index = 0; index < todos.length; index++)
                      TodoListItem(
                        todo: todos[index],
                        deleteTodo: deleteTodo,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Você possui ${todos.length} tarefas pendentes",
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDeleteTodosConfirmationDialog();
                    },
                    child: const Text(
                      "Limpar tudo",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(15.0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                            color: Colors.purple,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void deleteTodo(Todo todo) {
    deletedTodo = todo;
    deletedTodoIndex = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "A tarefa '${todo.title}' foi removida!",
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.purple[100],
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoIndex!, deletedTodo!);
            });
            todoRepository.saveTodoList(todos);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmar ação"),
        content: const Text("Deseja apagar todas as tarefas da lista?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                todos.clear();
              });
              Navigator.of(context).pop();
              todoRepository.saveTodoList(todos);
            },
            child: const Text("Apagar tudo"),
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
