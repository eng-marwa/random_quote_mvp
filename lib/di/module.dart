import 'package:get_it/get_it.dart';
import 'package:random_quote_mvp/network/api_service.dart';
import 'package:random_quote_mvp/presenter/random_quote_contract.dart';
import 'package:random_quote_mvp/presenter/random_quote_presenter.dart';

GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(),
  );
  getIt.registerFactoryParam<RandomQuotePresenter, RandomQuoteContract, void>(
      (view, _) => RandomQuotePresenter(view, getIt<ApiService>()));
}
