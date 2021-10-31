import 'package:flutter/material.dart';
import 'package:flutter_stacked_architecture/models/todo.dart';
import 'package:flutter_stacked_architecture/ui/views/todo_form/todo_form_view.dart';
import 'package:stacked/stacked.dart';
import 'edit_todo_view_model.dart';

class EditTodoView extends StatelessWidget {
  const EditTodoView({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditTodoViewModel>.reactive(
      viewModelBuilder: () => EditTodoViewModel(),
      builder: (context, model, _) {

        return Scaffold(
          appBar: AppBar(title: const Text('Edit todo')),
          body: TodoFormView(
            isEdit: true,
            formKey: model.editTodoFormKey,
            todo: todo,
            onSubmit: () {
              final updatedTodo = Todo(
                id: todo.id,
                title: model.todoService.title!,
                description: model.todoService.description,
                isComplete: false,
              );
              model.editTodo(updatedTodo);
              model.navigationService.popRepeated(1);
            },
          ),
        );
      },
    );
  }
}
