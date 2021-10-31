import 'package:flutter_stacked_architecture/app/app.locator.dart';
import 'package:flutter_stacked_architecture/services/api/todo_service.dart';
import 'package:stacked/stacked.dart';

class TodoFormViewModel extends BaseViewModel {
  final TodoService _todoService = locator<TodoService>();

  TodoService get todoService => _todoService;
  bool get isFormComplete => _todoService.title!.isNotEmpty;
}
