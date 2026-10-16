import 'package:flutter_test/flutter_test.dart';
import 'package:kids_coloring_game/main.dart';
import 'package:kids_coloring_game/services/artwork_storage_service.dart';
import 'package:kids_coloring_game/services/progress_service.dart';
import 'package:kids_coloring_game/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('App renders HomeView with play button and category cards', (WidgetTester tester) async {
    final progressService = ProgressService();
    await progressService.init();

    final storageService = ArtworkStorageService();
    await storageService.init();

    await tester.pumpWidget(
      KidsColoringApp(
        progressService: progressService,
        storageService: storageService,
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(HomeView), findsOneWidget);
    expect(find.text('LITTLE ARTIST'), findsOneWidget);
    expect(find.text('Play Now!'), findsOneWidget);
    expect(find.text('Coloring Categories'), findsOneWidget);
  });
}
