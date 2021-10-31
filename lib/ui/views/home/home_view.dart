import 'package:flutter/material.dart';
import 'package:flutter_stacked_architecture/app/app.router.dart';
import 'package:flutter_stacked_architecture/ui/shared/widgets/todo_card.dart';
import 'package:stacked/stacked.dart';
import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      createNewModelOnInsert: true,
      fireOnModelReadyOnce: false,
      onModelReady: (onModelReady) {},
      builder: (context, model, child) {
        final todos = model.todos;
        return Scaffold(
          appBar: AppBar(title: const Text('Flutter Stacked Architecture')),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              model.navigationService.navigateTo(Routes.addTodoView);
            },
          ),
          body: model.isBusy
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, i) => TodoCard(todo: todos[i]),
                ),
        );
      },
    );
  }
}
