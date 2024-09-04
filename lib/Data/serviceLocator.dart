import 'package:nytimes_feed/Common/DI.dart';
import 'package:nytimes_feed/Data/Network/dioClient.dart';
import 'package:nytimes_feed/Data/Repositories/articlesRepositoryImpl.dart';
import 'package:nytimes_feed/Domain/Repositories/articlesRepository.dart';

void _injectRepos() {
  DI.registerSingleton<ArticlesRepository>(Articlesrepositoryimpl());
}

void injectDataDependencies() {
  injectDio();
  _injectRepos();
}
