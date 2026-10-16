import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'services/artwork_storage_service.dart';
import 'services/progress_service.dart';
import 'theme/app_theme.dart';
import 'viewmodels/game_viewmodel.dart';
import 'views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI style & orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  final progressService = ProgressService();
  await progressService.init();

  final storageService = ArtworkStorageService();
  await storageService.init();

  runApp(
    KidsColoringApp(
      progressService: progressService,
      storageService: storageService,
    ),
  );
}

class KidsColoringApp extends StatelessWidget {
  final ProgressService? progressService;
  final ArtworkStorageService? storageService;

  const KidsColoringApp({
    super.key,
    this.progressService,
    this.storageService,
  });

  @override
  Widget build(BuildContext context) {
    final ps = progressService ?? ProgressService();
    final ss = storageService ?? ArtworkStorageService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProgressService>.value(value: ps),
        ChangeNotifierProvider<ArtworkStorageService>.value(value: ss),
        ChangeNotifierProvider<GameViewModel>(
          create: (context) => GameViewModel(progressService: ps),
        ),
      ],
      child: MaterialApp(
        title: 'Little Artist Coloring',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.kidTheme,
        home: const HomeView(),
      ),
    );
  }
}
