import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample_dec/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:riverpod_sample_dec/presentation/home_screen/state/home_screen_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(homeScreenProvider);
    return Scaffold(
      appBar: AppBar(title: Text(counterState.name ?? "no name")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                ref.read(homeScreenProvider.notifier).dec();
              },
              child: Text(counterState.count.toString()),
            ),

            IconButton(
              onPressed: () {
                ref.read(homeScreenProvider.notifier).cahngename();
              },
              icon: Icon(Icons.star),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homeScreenProvider.notifier).onIncrement();
          // ref.read(homeScreenProvider.notifier).cahngename();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
