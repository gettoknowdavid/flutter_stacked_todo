import 'package:flutter_stacked_architecture/app/app.locator.dart';
import 'package:flutter_stacked_architecture/services/navigation/bottom_bar_service.dart';
import 'package:stacked/stacked.dart';

class AppLayoutViewModel extends ReactiveViewModel {
  final BottomBarService _bottomBarService = locator<BottomBarService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_bottomBarService];

  int get currentIndex => _bottomBarService.currentIndex;

  void setIndex(int index) {
    _bottomBarService.setIndex(index);
    notifyListeners();
  }
}
