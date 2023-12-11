import 'package:clean_architecture_project/features/authentication/presentation/pages/login_screen.dart';
import 'package:clean_architecture_project/features/authentication/presentation/pages/register_screen.dart';
import 'package:clean_architecture_project/features/holidays/presentation/pages/holidays_home_screen.dart';
import 'package:clean_architecture_project/features/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
      routes: [
        // GoRoute(path: "agenda", builder: (context, state) => ,),
        // GoRoute(path: "sessions", builder: (context, state) => ,),
        GoRoute(path: "holidays", builder: (context, state) => const HolidaysHomeScreen(),),
        GoRoute(path: "login", builder: (context, state) => const LoginScreen(),),
        GoRoute(path: "register", builder: (context, state) => const RegisterScreen(),),
      ],
    ),
  ],
);
