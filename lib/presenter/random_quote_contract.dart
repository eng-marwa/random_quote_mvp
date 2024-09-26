import 'package:random_quote_mvp/models/random_quote_model.dart';

abstract class RandomQuoteContract {
  void displayQuote(RandomQuoteModel quote);
  void showError(String error);
  void showLoading();
  void hideLoading();
}
