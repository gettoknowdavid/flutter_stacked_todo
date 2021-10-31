import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stacked_architecture/ui/layout/app_layout_view_model.dart';
import 'package:flutter_stacked_architecture/ui/shared/widgets/bottom_bar.dart';
import 'package:flutter_stacked_architecture/ui/views/home/home_view.dart';
import 'package:flutter_stacked_architecture/ui/views/profile/profile_view.dart';
import 'package:flutter_stacked_architecture/ui/views/stats/stats_view.dart';
import 'package:stacked/stacked.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppLayoutViewModel>.reactive(
      viewModelBuilder: () => AppLayoutViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: PageTransitionSwitcher(
              child: getIndexView(viewModel.currentIndex),
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation, secondaryAnimation) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                  child: child,
                );
              },
            ),
          ),
          bottomNavigationBar: BottomBar(
            currentIndex: viewModel.currentIndex,
            onTap:  viewModel.setIndex,
          ),
        );
      },
    );
  }

  Widget getIndexView(int index) {
    switch (index) {
      case 0:
        return const StatsView();
      case 1:
        return const HomeView();
      case 2:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }
}
