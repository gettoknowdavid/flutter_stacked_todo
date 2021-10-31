import 'package:flutter/material.dart';
import 'package:flutter_stacked_architecture/models/todo.dart';
import 'package:stacked/stacked.dart';
import 'todo_form_view_model.dart';

class TodoFormView extends StatelessWidget {
  const TodoFormView({
    Key? key,
    this.isEdit = false,
    this.todo,
    required this.formKey,
    required this.onSubmit,
  }) : super(key: key);

  final bool isEdit;
  final Todo? todo;
  final GlobalKey<FormState> formKey;
  final Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoFormViewModel>.nonReactive(
      viewModelBuilder: () => TodoFormViewModel(),
      builder: (context, viewModel, _) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    initialValue: isEdit ? todo?.title : null,
                    onChanged: viewModel.todoService.updateTitle,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    initialValue: isEdit ? todo?.description : null,
                    onChanged: viewModel.todoService.updateDecription,
                    decoration: const InputDecoration(
                      label: Text('Description'),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  ElevatedButton(
                    onPressed: () {
                      if (viewModel.isFormComplete) {
                        onSubmit();
                      }
                    },
                    child: const Text('Add Todo'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
