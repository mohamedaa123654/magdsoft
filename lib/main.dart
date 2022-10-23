import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/business_logic/bloc_observer.dart';
import 'package:magdsoft/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft/presentation/router/app_router.dart';
import 'package:magdsoft/presentation/screens/shared/cubit/cubit.dart';
import 'package:magdsoft/presentation/screens/user/cubit/cubit.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => GlobalCubit()),
        ),
        BlocProvider(
          create: ((context) => AuthenticationCubit()),
        ),
        BlocProvider(
          create: ((context) => HomeCubit()
            ..getProducts()
            ..getHelp()),
        )
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return LayoutBuilder(builder: (context, constraints) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'magdsoft',
                  onGenerateRoute: widget.appRouter.onGenerateRoute,
                  initialRoute: Routes.splashRoute,
                  theme: ThemeData(
                    fontFamily: 'cairo',
                    appBarTheme: const AppBarTheme(
                      elevation: 0.0,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.dark,
                      ),
                    ),
                  ),
                );
              }
                  // ),
                  );
            },
          );
        },
      ),
    );
  }
}
