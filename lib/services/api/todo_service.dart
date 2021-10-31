import 'package:dio/dio.dart';
import 'package:flutter_stacked_architecture/api/retrofit_client.dart';
import 'package:flutter_stacked_architecture/models/todo.dart';
import 'package:stacked/stacked.dart';

class TodoService with ReactiveServiceMixin {
  TodoService() {
    listenToReactiveValues([_todos, _isEdit]);
  }

  final RetrofitClient _api = RetrofitClient(Dio());
  final ReactiveValue<List<Todo>> _todos = ReactiveValue<List<Todo>>([]);
  final ReactiveValue<bool> _isEdit = ReactiveValue<bool>(false);

  List<Todo> get todos => _todos.value;
  bool get isEdit => _isEdit.value;

  Future<List<Todo>> getTodos() async {
    _todos.value = await _api.getTodos();
    return _todos.value;
  }

  Future<Todo> addTodo(Todo todo) async {
    final newTodo = await _api.addTodo(
      todo.title,
      todo.description,
      todo.isComplete,
    );
    await getTodos();
    return newTodo;
  }

  Future<void> deleteTodo(String id) async {
    _todos.value.where((e) => e.id != id).toList();
    await _api.deleteTodo(id);
    await getTodos();
  }

  Future<Todo> editTodo(Todo todo) async {
    _isEdit.value = true;
    _todos.value.firstWhere((e) => e.id == todo.id).copyWith(
          id: todo.id,
          title: todo.title,
          description: todo.description,
          isComplete: todo.isComplete,
        );
    final updatedTodo = await _api.editTodo(
      todo.id!,
      title: todo.title,
      description: todo.description,
      isComplete: todo.isComplete,
    );
    await getTodos();
    return updatedTodo;
  }

  String? _title;
  String? get title => _title;

  String? _description;
  String? get description => _description;

  bool? _isComplete;
  bool? get isComplete => _isComplete;

  void updateTitle(String value) {
    _title = value;
    notifyListeners();
  }

  void updateDecription(String? value) {
    _description = value;
    notifyListeners();
  }

  Future<Todo> setIsComplete(Todo todo) async {
    _todos.value.firstWhere((e) => e.id == todo.id).copyWith(
          id: todo.id,
          isComplete: !todo.isComplete,
        );
    final updatedTodo = await _api.editTodo(
      todo.id!,
      isComplete: !todo.isComplete,
    );
    notifyListeners();
    await getTodos();
    return updatedTodo;
  }
}
