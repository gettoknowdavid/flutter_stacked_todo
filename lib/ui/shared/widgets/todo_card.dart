import 'package:flutter/material.dart';
import 'package:flutter_stacked_architecture/app/app.locator.dart';
import 'package:flutter_stacked_architecture/models/todo.dart';
import 'package:flutter_stacked_architecture/services/api/todo_service.dart';
import 'package:flutter_stacked_architecture/ui/views/edit_todo/edit_todo_view.dart';
import 'package:stacked_services/stacked_services.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    TodoService _todoService = locator<TodoService>();
    NavigationService _navService = locator<NavigationService>();

    bool isDesc = todo.description?.isNotEmpty ?? false;

    final textStyle = TextStyle(
      color: todo.isComplete
          ? Theme.of(context).disabledColor
          : Theme.of(context).textTheme.subtitle1?.color,
    );

    return Card(
      margin: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      shadowColor: Colors.black26,
      elevation: todo.isComplete ? 0.0 : 6.0,
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
        dense: todo.isComplete,
        onTap: () => _navService.navigateToView(EditTodoView(todo: todo)),
        subtitle: isDesc ? Text(todo.description!, style: textStyle) : null,
        title: Row(
          children: [
            Expanded(child: Text(todo.title, style: textStyle)),
            Row(
              children: [
                IconButton(
                  onPressed: () => _todoService.deleteTodo(todo.id!),
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
                Checkbox(
                  value: todo.isComplete,
                  onChanged: (_) async =>
                      await _todoService.setIsComplete(todo),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
