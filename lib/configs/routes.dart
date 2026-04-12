import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/blocs/member/member_bloc.dart';
import 'package:loyalty_app/screens/error_screen.dart';
import 'package:loyalty_app/screens/home_screen.dart';
import 'package:loyalty_app/screens/profile_screen.dart';
import 'package:loyalty_app/screens/test_page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const TestPage()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/profile',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => MemberBloc(),
          child: ProfileScreen(),
        );
      },
    ),
    GoRoute(path: '/error', builder: (context, state) => const ErrorScreen()),
  ],
);
