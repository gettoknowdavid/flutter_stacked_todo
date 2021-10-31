import 'package:flutter/cupertino.dart';
import 'package:flutter_stacked_architecture/app/app.locator.dart';
import 'package:flutter_stacked_architecture/models/todo.dart';
import 'package:flutter_stacked_architecture/services/api/todo_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddTodoViewModel extends ReactiveViewModel {
  final TodoService _todoService = locator<TodoService>();
  TodoService get todoService => _todoService;

  final NavigationService _navigationService = locator<NavigationService>();
  NavigationService get navigationService => _navigationService;

  final GlobalKey<FormState> _addTodoFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get addTodoFormKey => _addTodoFormKey;

  Future<Todo?> addTodo(Todo todo) async {
    await _todoService.addTodo(todo);
    notifyListeners();
    return todo;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_todoService];
}
