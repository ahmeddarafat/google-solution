/// External Package
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Internal Package
import 'package:flutter/material.dart';
import 'package:google_solution2/presentation/pages/bookmark/bookmark_page.dart';

/// Internal files
import 'logic/onboarding/onboarding_cubit.dart';
import 'resources/constants/app_constants.dart';
import 'logic/dashboard/dashboard_cubit.dart';
import 'logic/rate/cubit/rate_cubit.dart';
// import 'firebase_options.dart';
import 'resources/di/di.dart';
import 'resources/router/app_router.dart';
import 'resources/styles/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // to make splash stay
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DashboardCubit(),
        ),
        BlocProvider(
          create: (_) => RateCubit(),
        ),
        BlocProvider(
          create: (_) => OnboardingCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (_) => initLoginModule(),
          lazy: true,
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(ScreenSize.width, ScreenSize.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SWAI',
            theme: AppTheme.getLight(),
            onGenerateRoute: RouteGenerate.getRoute,
            // TODO: "data" - using shared prefs to make onboarding just first time
            initialRoute: AppRoutes.onBoarding,
          );
        },
      ),
    );
  }
}



// TODO: Tasks todo
// 1. merge between rate logic and rate cubit
// 2. create web view page
// 3. Caching bottom navigation bar
