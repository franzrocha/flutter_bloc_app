
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_finals/bloc/task%20blocs/task_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';


import 'app_router.dart';
import 'app_themes.dart';

import 'screens/tabs_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(appRouter: AppRouter())),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
          create: (_) => TaskBloc(),
        ),
     
      ],
      child: BlocBuilder (builder: (context, state) {
        return MaterialApp(
          title: 'BloC Tasks App',
          // theme: AppThemes.appThemeData[appTheme],
          home: const TabsScreen(),
          onGenerateRoute: appRouter.onGenerateRoute,
        );
      }),
    );
  }
}
