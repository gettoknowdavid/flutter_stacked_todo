import 'package:flutter/material.dart';
import 'package:flutter_stacked_architecture/app/app.locator.dart';
import 'package:flutter_stacked_architecture/models/todo.dart';
import 'package:flutter_stacked_architecture/services/api/todo_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditTodoViewModel extends ReactiveViewModel {
  final TodoService _todoService = locator<TodoService>();
  TodoService get todoService => _todoService;

  final NavigationService _navigationService = locator<NavigationService>();
  NavigationService get navigationService => _navigationService;

  final GlobalKey<FormState> _editTodoFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get editTodoFormKey => _editTodoFormKey;

  Future<Todo?> editTodo(Todo todo) async {
    final updatedTodo = _todoService.editTodo(todo);
    notifyListeners();
    return updatedTodo;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_todoService];
}
