import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavState {
  final int currentindex;

  BottomNavState({required this.currentindex});
}

class BottomNavNotifier extends StateNotifier<BottomNavState> {
  BottomNavNotifier() : super(BottomNavState(currentindex: 0));

  void updatePage(int index) {
    state = BottomNavState(currentindex: index);
  }
}
