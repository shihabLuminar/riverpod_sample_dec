import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_sample_dec/presentation/qotes_screen/state/quotes_screen_state.dart';
import 'package:riverpod_sample_dec/repository/api/quotes_screen/models/quote_res_model.dart';

final quotesScreenProvider = StateNotifierProvider(
  (ref) => QuotesScreenStateNotifier(),
);

class QuotesScreenStateNotifier extends StateNotifier<QuotesScreenState> {
  QuotesScreenStateNotifier() : super(QuotesScreenState());

  Future<void> getQuotes() async {
    // loading

    state = state.copyWith(isLoading: true);

    try {
      final url = Uri.parse("https://dummyjson.com/quotes");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        // convert to model and assign to state

        QuotesResModel resModel = quotesResModelFromJson(response.body);
        state = state.copyWith(quotes: resModel.quotes, isLoading: false);
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }

    // laoding
    state = state.copyWith(isLoading: false);
  }
}
