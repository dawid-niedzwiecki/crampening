import 'package:crampening/chess_board/chess_board.dart';
import 'package:crampening/l10n/l10n.dart';
import 'package:crampening/remote_config/remote_config.dart';
import 'package:crampening/repositories/remote_config.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          lazy: false,
          create: (context) => RemoteConfigRepository(
            remoteConfig: FirebaseRemoteConfig.instance,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RemoteConfigBloc(
              remoteConfigRepo:
                  RepositoryProvider.of<RemoteConfigRepository>(context),
            )..add(const RemoteConfigInitialiseEvent()),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusColor: Colors.black,
              border: OutlineInputBorder(),
            ),
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.grey[900],
            appBarTheme: AppBarTheme(color: Colors.grey[900]),
            elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white70),
              ),
            ),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const ChessBoardPage(),
        ),
      ),
    );
  }
}
