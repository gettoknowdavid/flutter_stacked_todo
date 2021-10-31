import 'package:flutter/material.dart';
import 'package:flutter_stacked_architecture/models/todo.dart';
import 'package:flutter_stacked_architecture/ui/views/todo_form/todo_form_view.dart';
import 'package:stacked/stacked.dart';
import 'add_todo_view_model.dart';

class AddTodoView extends StatelessWidget {
  const AddTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTodoViewModel>.reactive(
      viewModelBuilder: () => AddTodoViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Add todo')),
          body: TodoFormView(
            formKey: model.addTodoFormKey,
            onSubmit: () {
              final todo = Todo(
                title: model.todoService.title!,
                description: model.todoService.description,
                isComplete: false,
              );
              model.addTodo(todo);
              model.navigationService.popRepeated(1);
            },
          ),
        );
      },
    );
  }
}
