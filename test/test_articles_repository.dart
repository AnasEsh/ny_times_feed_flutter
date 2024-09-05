import 'package:flutter_test/flutter_test.dart';
import 'package:nytimes_feed/Common/DI.dart';
import 'package:nytimes_feed/Data/serviceLocator.dart';
import 'package:nytimes_feed/Domain/Repositories/articlesRepository.dart';
import 'package:nytimes_feed/Domain/UseCases/getPopularArticlesUseCase.dart';

void main() {
  injectDataDependencies();
  test("Get articles use case", () async {
    final useCase = GetPopularArticlesUseCase();
    final result = await useCase.execute();

    result.fold((failure) {
      print("Failed with error:$failure");
    }, (articlesList) {
      print("Recieived articles ${articlesList}");
    });
    expect(result.isRight() && result.getOrElse(() => []).isNotEmpty, isTrue);
  });
}
