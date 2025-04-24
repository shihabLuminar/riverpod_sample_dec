import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample_dec/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:riverpod_sample_dec/presentation/home_screen/state/home_screen_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(homeScreenProvider) as HomeScreenState;
    return Scaffold(
      body: Center(child: Text(counterState.count.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homeScreenProvider.notifier).onIncrement();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
