import 'package:random_quote_mvp/network/api_service.dart';
import 'package:random_quote_mvp/presenter/random_quote_contract.dart';

class RandomQuotePresenter {
  final RandomQuoteContract _view;
  final ApiService _service;

  RandomQuotePresenter(this._view, this._service);

  void getRandomQuote() async {
    _view.showLoading();
    try {
      final quote = await _service.fetchData();
      _view.displayQuote(quote);
    } catch (e) {
      _view.showError(e.toString());
    }
    _view.hideLoading();
  }
}
