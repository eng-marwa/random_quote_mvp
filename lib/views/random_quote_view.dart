import 'package:flutter/material.dart';
import 'package:random_quote_mvp/di/module.dart';
import 'package:random_quote_mvp/models/random_quote_model.dart';
import 'package:random_quote_mvp/presenter/random_quote_contract.dart';
import 'package:random_quote_mvp/presenter/random_quote_presenter.dart';

class RandomQuoteView extends StatefulWidget {
  const RandomQuoteView({super.key});

  @override
  State<RandomQuoteView> createState() => _RandomQuoteViewState();
}

class _RandomQuoteViewState extends State<RandomQuoteView>
    implements RandomQuoteContract {
  late RandomQuotePresenter _presenter;
  bool loader = false;

  RandomQuoteModel? _quote;

  @override
  void initState() {
    super.initState();
    _presenter = getIt<RandomQuotePresenter>(param1: this);
    _presenter.getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quote'),
      ),
      body: Center(
        child: loader
            ? const CircularProgressIndicator()
            : Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Quote of the day',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _quote?.quote ?? '',
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _quote?.author ?? '',
                      style: const TextStyle(
                          fontSize: 16, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  @override
  void displayQuote(RandomQuoteModel quote) {
    setState(() {
      _quote = quote;
    });
  }

  @override
  void hideLoading() {
    setState(() {
      loader = false;
    });
  }

  @override
  void showError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  @override
  void showLoading() {
    setState(() {
      loader = true;
    });
  }
}
