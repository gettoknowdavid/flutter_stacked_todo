// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/layout/app_layout.dart';
import '../ui/views/add_todo/add_todo_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/profile/profile_view.dart';
import '../ui/views/stats/stats_view.dart';

class Routes {
  static const String appLayout = '/';
  static const String homeView = '/home-view';
  static const String statsView = '/stats-view';
  static const String profileView = '/profile-view';
  static const String addTodoView = '/add-todo-view';
  static const all = <String>{
    appLayout,
    homeView,
    statsView,
    profileView,
    addTodoView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.appLayout, page: AppLayout),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.statsView, page: StatsView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.addTodoView, page: AddTodoView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    AppLayout: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AppLayout(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    StatsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StatsView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
    AddTodoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddTodoView(),
        settings: data,
      );
    },
  };
}
