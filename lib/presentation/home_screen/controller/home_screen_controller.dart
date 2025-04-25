import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample_dec/presentation/home_screen/state/home_screen_state.dart';

final homeScreenProvider = StateNotifierProvider(
  (ref) => HomeScreenStateNotifier(),
);

class HomeScreenStateNotifier extends StateNotifier<HomeScreenState> {
  HomeScreenStateNotifier() : super(HomeScreenState(count: 0, name: "shihab"));

  void onIncrement() {
    state = state.copyWith(count: state.count! + 1);
  }

  void dec() {
    state = state.copyWith(count: state.count! - 1);
  }

  void cahngename() {
    state = state.copyWith(name: "new name");
  }
}
