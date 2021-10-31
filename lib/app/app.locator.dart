// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api/todo_service.dart';
import '../services/navigation/bottom_bar_service.dart';
import '../ui/layout/app_layout_view_model.dart';
import '../ui/views/add_todo/add_todo_view_model.dart';
import '../ui/views/home/home_view_model.dart';
import '../ui/views/profile/profile_view_model.dart';
import '../ui/views/stats/stats_view_model.dart';
import '../ui/views/todo_form/todo_form_view_model.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => AppLayoutViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => StatsViewModel());
  locator.registerLazySingleton(() => ProfileViewModel());
  locator.registerLazySingleton(() => AddTodoViewModel());
  locator.registerLazySingleton(() => TodoFormViewModel());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => TodoService());
  locator.registerLazySingleton(() => BottomBarService());
  locator.registerLazySingleton(() => Dio());
}
