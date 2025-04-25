import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample_dec/presentation/qotes_screen/controller/quotes_screen_controller.dart';
import 'package:riverpod_sample_dec/presentation/qotes_screen/state/quotes_screen_state.dart';

class QuotesScreen extends ConsumerStatefulWidget {
  const QuotesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends ConsumerState<QuotesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(quotesScreenProvider.notifier).getQuotes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screeenState = ref.watch(quotesScreenProvider) as QuotesScreenState;
    return Scaffold(
      body:
          screeenState.isLoading! || screeenState.quotes == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemBuilder:
                    (context, index) => ListTile(
                      title: Text(
                        screeenState.quotes?[index].quote.toString() ??
                            "no  quote",
                      ),
                    ),
              ),
    );
  }
}
