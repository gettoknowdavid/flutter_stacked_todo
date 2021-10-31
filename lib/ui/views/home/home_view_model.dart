import 'package:flutter_stacked_architecture/app/app.locator.dart';
import 'package:flutter_stacked_architecture/models/todo.dart';
import 'package:flutter_stacked_architecture/services/api/todo_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<List<Todo?>>
    with ReactiveServiceMixin {
  final TodoService _todoService = locator<TodoService>();
  final NavigationService _navService = locator<NavigationService>();

  TodoService get todoService => _todoService;
  NavigationService get navigationService => _navService;

  List<Todo> get todos => todoService.todos;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_todoService];


  @override
  Future<List<Todo>> futureToRun() async {
    return await _todoService.getTodos();
  }
}
