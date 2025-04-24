import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample_dec/presentation/home_screen/state/home_screen_state.dart';

final homeScreenProvider = StateNotifierProvider(
  (ref) => HomeScreenStateNotifier(),
);

class HomeScreenStateNotifier extends StateNotifier<HomeScreenState> {
  HomeScreenStateNotifier() : super(HomeScreenState(count: 1000));

  void onIncrement() {
    int currentcount = state.count!;
    currentcount++;
    state = HomeScreenState(count: currentcount);
  }
}
