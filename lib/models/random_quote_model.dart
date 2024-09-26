class RandomQuoteModel {
  String quote;
  String author;

  RandomQuoteModel({required this.quote, required this.author});

  factory RandomQuoteModel.fromJson(Map<String, dynamic> json) {
    return RandomQuoteModel(quote: json['content'], author: json['author']);
  }
}
