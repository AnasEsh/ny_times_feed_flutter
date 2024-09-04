import 'package:flutter_test/flutter_test.dart';
import 'package:nytimes_feed/Common/DI.dart';
import 'package:nytimes_feed/Data/serviceLocator.dart';
import 'package:nytimes_feed/Domain/Repositories/articlesRepository.dart';

void main() {
  test("Articles Repo test", () async {
    injectDataDependencies();
    final repo = DI.get<ArticlesRepository>();
    final mostPopular = await repo.getMostPopularArticles();
    print(mostPopular);
  });
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
