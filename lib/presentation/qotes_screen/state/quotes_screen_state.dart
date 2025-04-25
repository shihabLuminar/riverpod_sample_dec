import 'package:riverpod_sample_dec/repository/api/quotes_screen/models/quote_res_model.dart';

class QuotesScreenState {
  bool? isLoading;
  List<Quote>? quotes;

  QuotesScreenState({this.isLoading = false, this.quotes});

  QuotesScreenState copyWith({bool? isLoading, List<Quote>? quotes}) {
    return QuotesScreenState(
      isLoading: isLoading ?? this.isLoading,
      quotes: quotes ?? this.quotes,
    );
  }
}
