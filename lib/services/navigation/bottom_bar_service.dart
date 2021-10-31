import 'package:stacked/stacked.dart';

class BottomBarService with ReactiveServiceMixin {
  BottomBarService() {
    listenToReactiveValues([_currentIndex]);
  }

  final ReactiveValue<int> _currentIndex = ReactiveValue<int>(1);

  int get currentIndex => _currentIndex.value;

  void setIndex(index) {
    _currentIndex.value = index;
  }
}
