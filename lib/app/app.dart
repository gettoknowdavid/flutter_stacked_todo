import 'package:dio/dio.dart';
import 'package:flutter_stacked_architecture/services/api/todo_service.dart';
import 'package:flutter_stacked_architecture/services/navigation/bottom_bar_service.dart';
import 'package:flutter_stacked_architecture/ui/layout/app_layout.dart';
import 'package:flutter_stacked_architecture/ui/layout/app_layout_view_model.dart';
import 'package:flutter_stacked_architecture/ui/views/add_todo/add_todo_view.dart';
import 'package:flutter_stacked_architecture/ui/views/add_todo/add_todo_view_model.dart';
import 'package:flutter_stacked_architecture/ui/views/home/home_view.dart';
import 'package:flutter_stacked_architecture/ui/views/home/home_view_model.dart';
import 'package:flutter_stacked_architecture/ui/views/profile/profile_view.dart';
import 'package:flutter_stacked_architecture/ui/views/profile/profile_view_model.dart';
import 'package:flutter_stacked_architecture/ui/views/stats/stats_view.dart';
import 'package:flutter_stacked_architecture/ui/views/stats/stats_view_model.dart';
import 'package:flutter_stacked_architecture/ui/views/todo_form/todo_form_view_model.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: AppLayout, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: StatsView),
  MaterialRoute(page: ProfileView),
  MaterialRoute(page: AddTodoView),
], dependencies: [
  LazySingleton(classType: AppLayoutViewModel),
  LazySingleton(classType: HomeViewModel),
  LazySingleton(classType: StatsViewModel),
  LazySingleton(classType: ProfileViewModel),
  LazySingleton(classType: AddTodoViewModel),
  LazySingleton(classType: TodoFormViewModel),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: TodoService),
  LazySingleton(classType: BottomBarService),
  LazySingleton(classType: Dio),
])
class App {}
